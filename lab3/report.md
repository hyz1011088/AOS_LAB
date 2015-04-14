#Lab3实验报告

##练习0：填写已有实验
覆盖kern/mm/default_pmm.c、kern/trap/trap.c、kern/debug/kdebug.c。

##练习1：给未被映射的地址映射上物理页
文件改动：mm/vmm.c do_pgdefault函数。
思路：首先调用get_pte函数得到ptep，然后判断是否为空，否则报错get失败。如果物理地址不存在，就分配一个页，然后给他分配一个逻辑地址。（若分配失败依旧报错，输出调试信息。）
思考题：1、 请描述页目录项（Pag Director Entry）和页表（Page Table Entry）中组成部分对ucore实现页替换算法的潜在用处。
核心思想就是：当一个页被分配到外存时，PTE的最后一位为0，中间7位保留，前24位则表示此页在硬盘上的其实扇区位置。
2、如果ucore的缺页服务例程在执行过程中访问内存，出现了页访问异常，请问硬件要做哪些事情？
缺页异常需要查找内存，此时又异常，系统会崩溃。


##练习2：补充完成基于FIFO的页面替换算法
文件改动：mm/vmm.c do_pgdefault函数。swap_fifo.c map_swappable和swap_out_vistim函数。
思路：第一部分就是缺页交换，如果准备好，就交换，否则返回失败。交换时先将也从硬盘交换到内存，然后建立物理地址和逻辑地址的映射关系，然后设置此页swappable。调用函数都可以完成。
思考题：如果要在ucore上实现"extended clock页替换算法"请给你的设计方案，现有的swap_manager框架是否足以支持在ucore中实现此算法？如果是，请给你的设计方案。如果不是，请给出你的新的扩展和基此扩展的设计方案。并需要回答如下问题
需要被换出的页的特征是什么？
答：最近未使用，且主存驻留期间页面内容未被修改过的页。
在ucore中如何判断具有这样特征的页？
答：在页表项中增加一位引用位和修改位，引用或修改时对应位置1.（0，0）组合的页优先换出。
何时进行换入和换出操作？
答：缺页异常时换入。换出有积极和消极两种策略，积极是每一秒扫描一次，消极是分配失败是换出。

##执行结果
```
(THU.CST) os is loading ...

Special kernel symbols:
  entry  0xc010002a (phys)
  etext  0xc0108b63 (phys)
  edata  0xc0120a68 (phys)
  end    0xc0121bb0 (phys)
Kernel executable memory footprint: 135KB
ebp:0xc011ff38 eip:0xc01009df args:0x00010094 0x00000000 0xc011ff68 0xc01000cb 
    kern/debug/kdebug.c:308: print_stackframe+21
ebp:0xc011ff48 eip:0xc0100cce args:0x00000000 0x00000000 0x00000000 0xc011ffb8 
    kern/debug/kmonitor.c:129: mon_backtrace+10
ebp:0xc011ff68 eip:0xc01000cb args:0x00000000 0xc011ff90 0xffff0000 0xc011ff94 
    kern/init/init.c:56: grade_backtrace2+33
ebp:0xc011ff88 eip:0xc01000f4 args:0x00000000 0xffff0000 0xc011ffb4 0x0000002a 
    kern/init/init.c:61: grade_backtrace1+38
ebp:0xc011ffa8 eip:0xc0100112 args:0x00000000 0xc010002a 0xffff0000 0x0000001d 
    kern/init/init.c:66: grade_backtrace0+23
ebp:0xc011ffc8 eip:0xc0100137 args:0xc0108b9c 0xc0108b80 0x00001148 0x00000000 
    kern/init/init.c:71: grade_backtrace+34
ebp:0xc011fff8 eip:0xc010007f args:0x00000000 0x00000000 0x0000ffff 0x40cf9a00 
    kern/init/init.c:31: kern_init+84
memory management: default_pmm_manager
e820map:
  memory: 0009fc00, [00000000, 0009fbff], type = 1.
  memory: 00000400, [0009fc00, 0009ffff], type = 2.
  memory: 00010000, [000f0000, 000fffff], type = 2.
  memory: 07efe000, [00100000, 07ffdfff], type = 1.
  memory: 00002000, [07ffe000, 07ffffff], type = 2.
  memory: 00040000, [fffc0000, ffffffff], type = 2.
check_alloc_page() succeeded!
check_pgdir() succeeded!
check_boot_pgdir() succeeded!
-------------------- BEGIN --------------------
PDE(0e0) c0000000-f8000000 38000000 urw
  |-- PTE(38000) c0000000-f8000000 38000000 -rw
PDE(001) fac00000-fb000000 00400000 -rw
  |-- PTE(000e0) faf00000-fafe0000 000e0000 urw
  |-- PTE(00001) fafeb000-fafec000 00001000 -rw
--------------------- END ---------------------
check_vma_struct() succeeded!
page fault at 0x00000100: K/W [no page found].
check_pgfault() succeeded!
check_vmm() succeeded.
ide 0:      10000(sectors), 'QEMU HARDDISK'.
ide 1:     262144(sectors), 'QEMU HARDDISK'.
SWAP: manager = fifo swap manager
BEGIN check_swap: count 31995, total 31995
setup Page Table for vaddr 0X1000, so alloc a page
setup Page Table vaddr 0~4MB OVER!
set up init env for check_swap begin!
page fault at 0x00001000: K/W [no page found].
page fault at 0x00002000: K/W [no page found].
page fault at 0x00003000: K/W [no page found].
page fault at 0x00004000: K/W [no page found].
set up init env for check_swap over!
write Virt Page c in fifo_check_swap
write Virt Page a in fifo_check_swap
write Virt Page d in fifo_check_swap
write Virt Page b in fifo_check_swap
write Virt Page e in fifo_check_swap
page fault at 0x00005000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x1000 to disk swap entry 2
write Virt Page b in fifo_check_swap
write Virt Page a in fifo_check_swap
page fault at 0x00001000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x2000 to disk swap entry 3
swap_in: load disk swap entry 2 with swap_page in vadr 0x1000
write Virt Page b in fifo_check_swap
page fault at 0x00002000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x3000 to disk swap entry 4
swap_in: load disk swap entry 3 with swap_page in vadr 0x2000
write Virt Page c in fifo_check_swap
page fault at 0x00003000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x4000 to disk swap entry 5
swap_in: load disk swap entry 4 with swap_page in vadr 0x3000
write Virt Page d in fifo_check_swap
page fault at 0x00004000: K/W [no page found].
swap_out: i 0, store page in vaddr 0x5000 to disk swap entry 6
swap_in: load disk swap entry 5 with swap_page in vadr 0x4000
count is 7, total is 7
check_swap() succeeded!
++ setup timer interrupts
100 ticks
100 ticks
100 ticks
100 ticks
100 ticks

```

