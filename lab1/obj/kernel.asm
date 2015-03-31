
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 80 fd 10 00       	mov    $0x10fd80,%edx
  10000b:	b8 18 ea 10 00       	mov    $0x10ea18,%eax
  100010:	89 d1                	mov    %edx,%ecx
  100012:	29 c1                	sub    %eax,%ecx
  100014:	89 c8                	mov    %ecx,%eax
  100016:	89 44 24 08          	mov    %eax,0x8(%esp)
  10001a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100021:	00 
  100022:	c7 04 24 18 ea 10 00 	movl   $0x10ea18,(%esp)
  100029:	e8 39 34 00 00       	call   103467 <memset>

    cons_init();                // init the console
  10002e:	e8 bb 15 00 00       	call   1015ee <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100033:	c7 45 f4 20 36 10 00 	movl   $0x103620,-0xc(%ebp)
    cprintf("%s\n\n", message);
  10003a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100041:	c7 04 24 3c 36 10 00 	movl   $0x10363c,(%esp)
  100048:	e8 ce 02 00 00       	call   10031b <cprintf>

    print_kerninfo();
  10004d:	e8 d8 07 00 00       	call   10082a <print_kerninfo>

    grade_backtrace();
  100052:	e8 86 00 00 00       	call   1000dd <grade_backtrace>

    pmm_init();                 // init physical memory management
  100057:	e8 fd 29 00 00       	call   102a59 <pmm_init>

    pic_init();                 // init interrupt controller
  10005c:	e8 d8 16 00 00       	call   101739 <pic_init>
    idt_init();                 // init interrupt descriptor table
  100061:	e8 2a 18 00 00       	call   101890 <idt_init>

    clock_init();               // init clock interrupt
  100066:	e8 d5 0c 00 00       	call   100d40 <clock_init>
    intr_enable();              // enable irq interrupt
  10006b:	e8 30 16 00 00       	call   1016a0 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  100070:	eb fe                	jmp    100070 <kern_init+0x70>

00100072 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100072:	55                   	push   %ebp
  100073:	89 e5                	mov    %esp,%ebp
  100075:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100078:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007f:	00 
  100080:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100087:	00 
  100088:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008f:	e8 d6 0b 00 00       	call   100c6a <mon_backtrace>
}
  100094:	c9                   	leave  
  100095:	c3                   	ret    

00100096 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100096:	55                   	push   %ebp
  100097:	89 e5                	mov    %esp,%ebp
  100099:	53                   	push   %ebx
  10009a:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009d:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  1000a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a3:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a9:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ad:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000b1:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b5:	89 04 24             	mov    %eax,(%esp)
  1000b8:	e8 b5 ff ff ff       	call   100072 <grade_backtrace2>
}
  1000bd:	83 c4 14             	add    $0x14,%esp
  1000c0:	5b                   	pop    %ebx
  1000c1:	5d                   	pop    %ebp
  1000c2:	c3                   	ret    

001000c3 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c3:	55                   	push   %ebp
  1000c4:	89 e5                	mov    %esp,%ebp
  1000c6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c9:	8b 45 10             	mov    0x10(%ebp),%eax
  1000cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d3:	89 04 24             	mov    %eax,(%esp)
  1000d6:	e8 bb ff ff ff       	call   100096 <grade_backtrace1>
}
  1000db:	c9                   	leave  
  1000dc:	c3                   	ret    

001000dd <grade_backtrace>:

void
grade_backtrace(void) {
  1000dd:	55                   	push   %ebp
  1000de:	89 e5                	mov    %esp,%ebp
  1000e0:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e8:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ef:	ff 
  1000f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000fb:	e8 c3 ff ff ff       	call   1000c3 <grade_backtrace0>
}
  100100:	c9                   	leave  
  100101:	c3                   	ret    

00100102 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100102:	55                   	push   %ebp
  100103:	89 e5                	mov    %esp,%ebp
  100105:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100108:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  10010b:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010e:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100111:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100114:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100118:	0f b7 c0             	movzwl %ax,%eax
  10011b:	89 c2                	mov    %eax,%edx
  10011d:	83 e2 03             	and    $0x3,%edx
  100120:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100125:	89 54 24 08          	mov    %edx,0x8(%esp)
  100129:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012d:	c7 04 24 41 36 10 00 	movl   $0x103641,(%esp)
  100134:	e8 e2 01 00 00       	call   10031b <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100139:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013d:	0f b7 d0             	movzwl %ax,%edx
  100140:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100145:	89 54 24 08          	mov    %edx,0x8(%esp)
  100149:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014d:	c7 04 24 4f 36 10 00 	movl   $0x10364f,(%esp)
  100154:	e8 c2 01 00 00       	call   10031b <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100159:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015d:	0f b7 d0             	movzwl %ax,%edx
  100160:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100165:	89 54 24 08          	mov    %edx,0x8(%esp)
  100169:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016d:	c7 04 24 5d 36 10 00 	movl   $0x10365d,(%esp)
  100174:	e8 a2 01 00 00       	call   10031b <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100179:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017d:	0f b7 d0             	movzwl %ax,%edx
  100180:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100185:	89 54 24 08          	mov    %edx,0x8(%esp)
  100189:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018d:	c7 04 24 6b 36 10 00 	movl   $0x10366b,(%esp)
  100194:	e8 82 01 00 00       	call   10031b <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100199:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019d:	0f b7 d0             	movzwl %ax,%edx
  1001a0:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 79 36 10 00 	movl   $0x103679,(%esp)
  1001b4:	e8 62 01 00 00       	call   10031b <cprintf>
    round ++;
  1001b9:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001be:	83 c0 01             	add    $0x1,%eax
  1001c1:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c6:	c9                   	leave  
  1001c7:	c3                   	ret    

001001c8 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c8:	55                   	push   %ebp
  1001c9:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001cb:	5d                   	pop    %ebp
  1001cc:	c3                   	ret    

001001cd <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cd:	55                   	push   %ebp
  1001ce:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001d0:	5d                   	pop    %ebp
  1001d1:	c3                   	ret    

001001d2 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d2:	55                   	push   %ebp
  1001d3:	89 e5                	mov    %esp,%ebp
  1001d5:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d8:	e8 25 ff ff ff       	call   100102 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001dd:	c7 04 24 88 36 10 00 	movl   $0x103688,(%esp)
  1001e4:	e8 32 01 00 00       	call   10031b <cprintf>
    lab1_switch_to_user();
  1001e9:	e8 da ff ff ff       	call   1001c8 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ee:	e8 0f ff ff ff       	call   100102 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f3:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  1001fa:	e8 1c 01 00 00       	call   10031b <cprintf>
    lab1_switch_to_kernel();
  1001ff:	e8 c9 ff ff ff       	call   1001cd <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100204:	e8 f9 fe ff ff       	call   100102 <lab1_print_cur_status>
}
  100209:	c9                   	leave  
  10020a:	c3                   	ret    
	...

0010020c <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10020c:	55                   	push   %ebp
  10020d:	89 e5                	mov    %esp,%ebp
  10020f:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100212:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100216:	74 13                	je     10022b <readline+0x1f>
        cprintf("%s", prompt);
  100218:	8b 45 08             	mov    0x8(%ebp),%eax
  10021b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021f:	c7 04 24 c7 36 10 00 	movl   $0x1036c7,(%esp)
  100226:	e8 f0 00 00 00       	call   10031b <cprintf>
    }
    int i = 0, c;
  10022b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100232:	eb 01                	jmp    100235 <readline+0x29>
        else if (c == '\n' || c == '\r') {
            cputchar(c);
            buf[i] = '\0';
            return buf;
        }
    }
  100234:	90                   	nop
    if (prompt != NULL) {
        cprintf("%s", prompt);
    }
    int i = 0, c;
    while (1) {
        c = getchar();
  100235:	e8 6e 01 00 00       	call   1003a8 <getchar>
  10023a:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10023d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100241:	79 07                	jns    10024a <readline+0x3e>
            return NULL;
  100243:	b8 00 00 00 00       	mov    $0x0,%eax
  100248:	eb 79                	jmp    1002c3 <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  10024a:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10024e:	7e 28                	jle    100278 <readline+0x6c>
  100250:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100257:	7f 1f                	jg     100278 <readline+0x6c>
            cputchar(c);
  100259:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10025c:	89 04 24             	mov    %eax,(%esp)
  10025f:	e8 df 00 00 00       	call   100343 <cputchar>
            buf[i ++] = c;
  100264:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100267:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10026a:	81 c2 40 ea 10 00    	add    $0x10ea40,%edx
  100270:	88 02                	mov    %al,(%edx)
  100272:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100276:	eb 46                	jmp    1002be <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  100278:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10027c:	75 17                	jne    100295 <readline+0x89>
  10027e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100282:	7e 11                	jle    100295 <readline+0x89>
            cputchar(c);
  100284:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100287:	89 04 24             	mov    %eax,(%esp)
  10028a:	e8 b4 00 00 00       	call   100343 <cputchar>
            i --;
  10028f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100293:	eb 29                	jmp    1002be <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  100295:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100299:	74 06                	je     1002a1 <readline+0x95>
  10029b:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10029f:	75 93                	jne    100234 <readline+0x28>
            cputchar(c);
  1002a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a4:	89 04 24             	mov    %eax,(%esp)
  1002a7:	e8 97 00 00 00       	call   100343 <cputchar>
            buf[i] = '\0';
  1002ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002af:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002b4:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b7:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002bc:	eb 05                	jmp    1002c3 <readline+0xb7>
        }
    }
  1002be:	e9 71 ff ff ff       	jmp    100234 <readline+0x28>
}
  1002c3:	c9                   	leave  
  1002c4:	c3                   	ret    
  1002c5:	00 00                	add    %al,(%eax)
	...

001002c8 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002c8:	55                   	push   %ebp
  1002c9:	89 e5                	mov    %esp,%ebp
  1002cb:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1002d1:	89 04 24             	mov    %eax,(%esp)
  1002d4:	e8 41 13 00 00       	call   10161a <cons_putc>
    (*cnt) ++;
  1002d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002dc:	8b 00                	mov    (%eax),%eax
  1002de:	8d 50 01             	lea    0x1(%eax),%edx
  1002e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002e4:	89 10                	mov    %edx,(%eax)
}
  1002e6:	c9                   	leave  
  1002e7:	c3                   	ret    

001002e8 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002e8:	55                   	push   %ebp
  1002e9:	89 e5                	mov    %esp,%ebp
  1002eb:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ff:	89 44 24 08          	mov    %eax,0x8(%esp)
  100303:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100306:	89 44 24 04          	mov    %eax,0x4(%esp)
  10030a:	c7 04 24 c8 02 10 00 	movl   $0x1002c8,(%esp)
  100311:	e8 54 29 00 00       	call   102c6a <vprintfmt>
    return cnt;
  100316:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100319:	c9                   	leave  
  10031a:	c3                   	ret    

0010031b <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10031b:	55                   	push   %ebp
  10031c:	89 e5                	mov    %esp,%ebp
  10031e:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100321:	8d 55 0c             	lea    0xc(%ebp),%edx
  100324:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100327:	89 10                	mov    %edx,(%eax)
    cnt = vcprintf(fmt, ap);
  100329:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10032c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100330:	8b 45 08             	mov    0x8(%ebp),%eax
  100333:	89 04 24             	mov    %eax,(%esp)
  100336:	e8 ad ff ff ff       	call   1002e8 <vcprintf>
  10033b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10033e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100341:	c9                   	leave  
  100342:	c3                   	ret    

00100343 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100343:	55                   	push   %ebp
  100344:	89 e5                	mov    %esp,%ebp
  100346:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100349:	8b 45 08             	mov    0x8(%ebp),%eax
  10034c:	89 04 24             	mov    %eax,(%esp)
  10034f:	e8 c6 12 00 00       	call   10161a <cons_putc>
}
  100354:	c9                   	leave  
  100355:	c3                   	ret    

00100356 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100356:	55                   	push   %ebp
  100357:	89 e5                	mov    %esp,%ebp
  100359:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10035c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100363:	eb 13                	jmp    100378 <cputs+0x22>
        cputch(c, &cnt);
  100365:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  100369:	8d 55 f0             	lea    -0x10(%ebp),%edx
  10036c:	89 54 24 04          	mov    %edx,0x4(%esp)
  100370:	89 04 24             	mov    %eax,(%esp)
  100373:	e8 50 ff ff ff       	call   1002c8 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  100378:	8b 45 08             	mov    0x8(%ebp),%eax
  10037b:	0f b6 00             	movzbl (%eax),%eax
  10037e:	88 45 f7             	mov    %al,-0x9(%ebp)
  100381:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100385:	0f 95 c0             	setne  %al
  100388:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10038c:	84 c0                	test   %al,%al
  10038e:	75 d5                	jne    100365 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100390:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100393:	89 44 24 04          	mov    %eax,0x4(%esp)
  100397:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10039e:	e8 25 ff ff ff       	call   1002c8 <cputch>
    return cnt;
  1003a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1003a6:	c9                   	leave  
  1003a7:	c3                   	ret    

001003a8 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1003a8:	55                   	push   %ebp
  1003a9:	89 e5                	mov    %esp,%ebp
  1003ab:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003ae:	e8 90 12 00 00       	call   101643 <cons_getc>
  1003b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ba:	74 f2                	je     1003ae <getchar+0x6>
        /* do nothing */;
    return c;
  1003bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003bf:	c9                   	leave  
  1003c0:	c3                   	ret    
  1003c1:	00 00                	add    %al,(%eax)
	...

001003c4 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003c4:	55                   	push   %ebp
  1003c5:	89 e5                	mov    %esp,%ebp
  1003c7:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003cd:	8b 00                	mov    (%eax),%eax
  1003cf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003d2:	8b 45 10             	mov    0x10(%ebp),%eax
  1003d5:	8b 00                	mov    (%eax),%eax
  1003d7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003e1:	e9 c6 00 00 00       	jmp    1004ac <stab_binsearch+0xe8>
        int true_m = (l + r) / 2, m = true_m;
  1003e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003ec:	01 d0                	add    %edx,%eax
  1003ee:	89 c2                	mov    %eax,%edx
  1003f0:	c1 ea 1f             	shr    $0x1f,%edx
  1003f3:	01 d0                	add    %edx,%eax
  1003f5:	d1 f8                	sar    %eax
  1003f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003fd:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100400:	eb 04                	jmp    100406 <stab_binsearch+0x42>
            m --;
  100402:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  100406:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100409:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10040c:	7c 1b                	jl     100429 <stab_binsearch+0x65>
  10040e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100411:	89 d0                	mov    %edx,%eax
  100413:	01 c0                	add    %eax,%eax
  100415:	01 d0                	add    %edx,%eax
  100417:	c1 e0 02             	shl    $0x2,%eax
  10041a:	03 45 08             	add    0x8(%ebp),%eax
  10041d:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100421:	0f b6 c0             	movzbl %al,%eax
  100424:	3b 45 14             	cmp    0x14(%ebp),%eax
  100427:	75 d9                	jne    100402 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  100429:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10042c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10042f:	7d 0b                	jge    10043c <stab_binsearch+0x78>
            l = true_m + 1;
  100431:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100434:	83 c0 01             	add    $0x1,%eax
  100437:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10043a:	eb 70                	jmp    1004ac <stab_binsearch+0xe8>
        }

        // actual binary search
        any_matches = 1;
  10043c:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100443:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100446:	89 d0                	mov    %edx,%eax
  100448:	01 c0                	add    %eax,%eax
  10044a:	01 d0                	add    %edx,%eax
  10044c:	c1 e0 02             	shl    $0x2,%eax
  10044f:	03 45 08             	add    0x8(%ebp),%eax
  100452:	8b 40 08             	mov    0x8(%eax),%eax
  100455:	3b 45 18             	cmp    0x18(%ebp),%eax
  100458:	73 13                	jae    10046d <stab_binsearch+0xa9>
            *region_left = m;
  10045a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10045d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100460:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100462:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100465:	83 c0 01             	add    $0x1,%eax
  100468:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10046b:	eb 3f                	jmp    1004ac <stab_binsearch+0xe8>
        } else if (stabs[m].n_value > addr) {
  10046d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100470:	89 d0                	mov    %edx,%eax
  100472:	01 c0                	add    %eax,%eax
  100474:	01 d0                	add    %edx,%eax
  100476:	c1 e0 02             	shl    $0x2,%eax
  100479:	03 45 08             	add    0x8(%ebp),%eax
  10047c:	8b 40 08             	mov    0x8(%eax),%eax
  10047f:	3b 45 18             	cmp    0x18(%ebp),%eax
  100482:	76 16                	jbe    10049a <stab_binsearch+0xd6>
            *region_right = m - 1;
  100484:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100487:	8d 50 ff             	lea    -0x1(%eax),%edx
  10048a:	8b 45 10             	mov    0x10(%ebp),%eax
  10048d:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100492:	83 e8 01             	sub    $0x1,%eax
  100495:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100498:	eb 12                	jmp    1004ac <stab_binsearch+0xe8>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10049a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004a0:	89 10                	mov    %edx,(%eax)
            l = m;
  1004a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a8:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004b2:	0f 8e 2e ff ff ff    	jle    1003e6 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004bc:	75 0f                	jne    1004cd <stab_binsearch+0x109>
        *region_right = *region_left - 1;
  1004be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004c1:	8b 00                	mov    (%eax),%eax
  1004c3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c9:	89 10                	mov    %edx,(%eax)
  1004cb:	eb 3b                	jmp    100508 <stab_binsearch+0x144>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004cd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004d0:	8b 00                	mov    (%eax),%eax
  1004d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d5:	eb 04                	jmp    1004db <stab_binsearch+0x117>
  1004d7:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004de:	8b 00                	mov    (%eax),%eax
  1004e0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004e3:	7d 1b                	jge    100500 <stab_binsearch+0x13c>
  1004e5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e8:	89 d0                	mov    %edx,%eax
  1004ea:	01 c0                	add    %eax,%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	c1 e0 02             	shl    $0x2,%eax
  1004f1:	03 45 08             	add    0x8(%ebp),%eax
  1004f4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f8:	0f b6 c0             	movzbl %al,%eax
  1004fb:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fe:	75 d7                	jne    1004d7 <stab_binsearch+0x113>
            /* do nothing */;
        *region_left = l;
  100500:	8b 45 0c             	mov    0xc(%ebp),%eax
  100503:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100506:	89 10                	mov    %edx,(%eax)
    }
}
  100508:	c9                   	leave  
  100509:	c3                   	ret    

0010050a <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10050a:	55                   	push   %ebp
  10050b:	89 e5                	mov    %esp,%ebp
  10050d:	53                   	push   %ebx
  10050e:	83 ec 54             	sub    $0x54,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100511:	8b 45 0c             	mov    0xc(%ebp),%eax
  100514:	c7 00 cc 36 10 00    	movl   $0x1036cc,(%eax)
    info->eip_line = 0;
  10051a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100524:	8b 45 0c             	mov    0xc(%ebp),%eax
  100527:	c7 40 08 cc 36 10 00 	movl   $0x1036cc,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100531:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100538:	8b 45 0c             	mov    0xc(%ebp),%eax
  10053b:	8b 55 08             	mov    0x8(%ebp),%edx
  10053e:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100541:	8b 45 0c             	mov    0xc(%ebp),%eax
  100544:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10054b:	c7 45 f4 2c 3f 10 00 	movl   $0x103f2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100552:	c7 45 f0 1c b8 10 00 	movl   $0x10b81c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100559:	c7 45 ec 1d b8 10 00 	movl   $0x10b81d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100560:	c7 45 e8 f3 d7 10 00 	movl   $0x10d7f3,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100567:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10056a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056d:	76 0d                	jbe    10057c <debuginfo_eip+0x72>
  10056f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100572:	83 e8 01             	sub    $0x1,%eax
  100575:	0f b6 00             	movzbl (%eax),%eax
  100578:	84 c0                	test   %al,%al
  10057a:	74 0a                	je     100586 <debuginfo_eip+0x7c>
        return -1;
  10057c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100581:	e9 9e 02 00 00       	jmp    100824 <debuginfo_eip+0x31a>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100586:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100590:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100593:	89 d1                	mov    %edx,%ecx
  100595:	29 c1                	sub    %eax,%ecx
  100597:	89 c8                	mov    %ecx,%eax
  100599:	c1 f8 02             	sar    $0x2,%eax
  10059c:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1005a2:	83 e8 01             	sub    $0x1,%eax
  1005a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ab:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005af:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b6:	00 
  1005b7:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005ba:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005be:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c8:	89 04 24             	mov    %eax,(%esp)
  1005cb:	e8 f4 fd ff ff       	call   1003c4 <stab_binsearch>
    if (lfile == 0)
  1005d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005d3:	85 c0                	test   %eax,%eax
  1005d5:	75 0a                	jne    1005e1 <debuginfo_eip+0xd7>
        return -1;
  1005d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005dc:	e9 43 02 00 00       	jmp    100824 <debuginfo_eip+0x31a>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e4:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005ea:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f0:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f4:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005fb:	00 
  1005fc:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005ff:	89 44 24 08          	mov    %eax,0x8(%esp)
  100603:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100606:	89 44 24 04          	mov    %eax,0x4(%esp)
  10060a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10060d:	89 04 24             	mov    %eax,(%esp)
  100610:	e8 af fd ff ff       	call   1003c4 <stab_binsearch>

    if (lfun <= rfun) {
  100615:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100618:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10061b:	39 c2                	cmp    %eax,%edx
  10061d:	7f 72                	jg     100691 <debuginfo_eip+0x187>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100622:	89 c2                	mov    %eax,%edx
  100624:	89 d0                	mov    %edx,%eax
  100626:	01 c0                	add    %eax,%eax
  100628:	01 d0                	add    %edx,%eax
  10062a:	c1 e0 02             	shl    $0x2,%eax
  10062d:	03 45 f4             	add    -0xc(%ebp),%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	89 cb                	mov    %ecx,%ebx
  10063a:	29 c3                	sub    %eax,%ebx
  10063c:	89 d8                	mov    %ebx,%eax
  10063e:	39 c2                	cmp    %eax,%edx
  100640:	73 1e                	jae    100660 <debuginfo_eip+0x156>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100642:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100645:	89 c2                	mov    %eax,%edx
  100647:	89 d0                	mov    %edx,%eax
  100649:	01 c0                	add    %eax,%eax
  10064b:	01 d0                	add    %edx,%eax
  10064d:	c1 e0 02             	shl    $0x2,%eax
  100650:	03 45 f4             	add    -0xc(%ebp),%eax
  100653:	8b 00                	mov    (%eax),%eax
  100655:	89 c2                	mov    %eax,%edx
  100657:	03 55 ec             	add    -0x14(%ebp),%edx
  10065a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065d:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100660:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100663:	89 c2                	mov    %eax,%edx
  100665:	89 d0                	mov    %edx,%eax
  100667:	01 c0                	add    %eax,%eax
  100669:	01 d0                	add    %edx,%eax
  10066b:	c1 e0 02             	shl    $0x2,%eax
  10066e:	03 45 f4             	add    -0xc(%ebp),%eax
  100671:	8b 50 08             	mov    0x8(%eax),%edx
  100674:	8b 45 0c             	mov    0xc(%ebp),%eax
  100677:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	8b 40 10             	mov    0x10(%eax),%eax
  100680:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100683:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100686:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100689:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10068c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10068f:	eb 15                	jmp    1006a6 <debuginfo_eip+0x19c>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100691:	8b 45 0c             	mov    0xc(%ebp),%eax
  100694:	8b 55 08             	mov    0x8(%ebp),%edx
  100697:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  10069a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10069d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a3:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006a9:	8b 40 08             	mov    0x8(%eax),%eax
  1006ac:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b3:	00 
  1006b4:	89 04 24             	mov    %eax,(%esp)
  1006b7:	e8 23 2c 00 00       	call   1032df <strfind>
  1006bc:	89 c2                	mov    %eax,%edx
  1006be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c1:	8b 40 08             	mov    0x8(%eax),%eax
  1006c4:	29 c2                	sub    %eax,%edx
  1006c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c9:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006cf:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d3:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006da:	00 
  1006db:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006de:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e2:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006e5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006ec:	89 04 24             	mov    %eax,(%esp)
  1006ef:	e8 d0 fc ff ff       	call   1003c4 <stab_binsearch>
    if (lline <= rline) {
  1006f4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006f7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1006fa:	39 c2                	cmp    %eax,%edx
  1006fc:	7f 20                	jg     10071e <debuginfo_eip+0x214>
        info->eip_line = stabs[rline].n_desc;
  1006fe:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100701:	89 c2                	mov    %eax,%edx
  100703:	89 d0                	mov    %edx,%eax
  100705:	01 c0                	add    %eax,%eax
  100707:	01 d0                	add    %edx,%eax
  100709:	c1 e0 02             	shl    $0x2,%eax
  10070c:	03 45 f4             	add    -0xc(%ebp),%eax
  10070f:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100713:	0f b7 d0             	movzwl %ax,%edx
  100716:	8b 45 0c             	mov    0xc(%ebp),%eax
  100719:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10071c:	eb 13                	jmp    100731 <debuginfo_eip+0x227>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  10071e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100723:	e9 fc 00 00 00       	jmp    100824 <debuginfo_eip+0x31a>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100728:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10072b:	83 e8 01             	sub    $0x1,%eax
  10072e:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100731:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100734:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100737:	39 c2                	cmp    %eax,%edx
  100739:	7c 4a                	jl     100785 <debuginfo_eip+0x27b>
           && stabs[lline].n_type != N_SOL
  10073b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10073e:	89 c2                	mov    %eax,%edx
  100740:	89 d0                	mov    %edx,%eax
  100742:	01 c0                	add    %eax,%eax
  100744:	01 d0                	add    %edx,%eax
  100746:	c1 e0 02             	shl    $0x2,%eax
  100749:	03 45 f4             	add    -0xc(%ebp),%eax
  10074c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100750:	3c 84                	cmp    $0x84,%al
  100752:	74 31                	je     100785 <debuginfo_eip+0x27b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100754:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100757:	89 c2                	mov    %eax,%edx
  100759:	89 d0                	mov    %edx,%eax
  10075b:	01 c0                	add    %eax,%eax
  10075d:	01 d0                	add    %edx,%eax
  10075f:	c1 e0 02             	shl    $0x2,%eax
  100762:	03 45 f4             	add    -0xc(%ebp),%eax
  100765:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100769:	3c 64                	cmp    $0x64,%al
  10076b:	75 bb                	jne    100728 <debuginfo_eip+0x21e>
  10076d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	89 d0                	mov    %edx,%eax
  100774:	01 c0                	add    %eax,%eax
  100776:	01 d0                	add    %edx,%eax
  100778:	c1 e0 02             	shl    $0x2,%eax
  10077b:	03 45 f4             	add    -0xc(%ebp),%eax
  10077e:	8b 40 08             	mov    0x8(%eax),%eax
  100781:	85 c0                	test   %eax,%eax
  100783:	74 a3                	je     100728 <debuginfo_eip+0x21e>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100785:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100788:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10078b:	39 c2                	cmp    %eax,%edx
  10078d:	7c 40                	jl     1007cf <debuginfo_eip+0x2c5>
  10078f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100792:	89 c2                	mov    %eax,%edx
  100794:	89 d0                	mov    %edx,%eax
  100796:	01 c0                	add    %eax,%eax
  100798:	01 d0                	add    %edx,%eax
  10079a:	c1 e0 02             	shl    $0x2,%eax
  10079d:	03 45 f4             	add    -0xc(%ebp),%eax
  1007a0:	8b 10                	mov    (%eax),%edx
  1007a2:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007a8:	89 cb                	mov    %ecx,%ebx
  1007aa:	29 c3                	sub    %eax,%ebx
  1007ac:	89 d8                	mov    %ebx,%eax
  1007ae:	39 c2                	cmp    %eax,%edx
  1007b0:	73 1d                	jae    1007cf <debuginfo_eip+0x2c5>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007b2:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007b5:	89 c2                	mov    %eax,%edx
  1007b7:	89 d0                	mov    %edx,%eax
  1007b9:	01 c0                	add    %eax,%eax
  1007bb:	01 d0                	add    %edx,%eax
  1007bd:	c1 e0 02             	shl    $0x2,%eax
  1007c0:	03 45 f4             	add    -0xc(%ebp),%eax
  1007c3:	8b 00                	mov    (%eax),%eax
  1007c5:	89 c2                	mov    %eax,%edx
  1007c7:	03 55 ec             	add    -0x14(%ebp),%edx
  1007ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007cd:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007cf:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007d2:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007d5:	39 c2                	cmp    %eax,%edx
  1007d7:	7d 46                	jge    10081f <debuginfo_eip+0x315>
        for (lline = lfun + 1;
  1007d9:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007dc:	83 c0 01             	add    $0x1,%eax
  1007df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007e2:	eb 18                	jmp    1007fc <debuginfo_eip+0x2f2>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1007e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e7:	8b 40 14             	mov    0x14(%eax),%eax
  1007ea:	8d 50 01             	lea    0x1(%eax),%edx
  1007ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f0:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1007f3:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007f6:	83 c0 01             	add    $0x1,%eax
  1007f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1007fc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007ff:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  100802:	39 c2                	cmp    %eax,%edx
  100804:	7d 19                	jge    10081f <debuginfo_eip+0x315>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100806:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100809:	89 c2                	mov    %eax,%edx
  10080b:	89 d0                	mov    %edx,%eax
  10080d:	01 c0                	add    %eax,%eax
  10080f:	01 d0                	add    %edx,%eax
  100811:	c1 e0 02             	shl    $0x2,%eax
  100814:	03 45 f4             	add    -0xc(%ebp),%eax
  100817:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10081b:	3c a0                	cmp    $0xa0,%al
  10081d:	74 c5                	je     1007e4 <debuginfo_eip+0x2da>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10081f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100824:	83 c4 54             	add    $0x54,%esp
  100827:	5b                   	pop    %ebx
  100828:	5d                   	pop    %ebp
  100829:	c3                   	ret    

0010082a <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  10082a:	55                   	push   %ebp
  10082b:	89 e5                	mov    %esp,%ebp
  10082d:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100830:	c7 04 24 d6 36 10 00 	movl   $0x1036d6,(%esp)
  100837:	e8 df fa ff ff       	call   10031b <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10083c:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100843:	00 
  100844:	c7 04 24 ef 36 10 00 	movl   $0x1036ef,(%esp)
  10084b:	e8 cb fa ff ff       	call   10031b <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100850:	c7 44 24 04 1f 36 10 	movl   $0x10361f,0x4(%esp)
  100857:	00 
  100858:	c7 04 24 07 37 10 00 	movl   $0x103707,(%esp)
  10085f:	e8 b7 fa ff ff       	call   10031b <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100864:	c7 44 24 04 18 ea 10 	movl   $0x10ea18,0x4(%esp)
  10086b:	00 
  10086c:	c7 04 24 1f 37 10 00 	movl   $0x10371f,(%esp)
  100873:	e8 a3 fa ff ff       	call   10031b <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100878:	c7 44 24 04 80 fd 10 	movl   $0x10fd80,0x4(%esp)
  10087f:	00 
  100880:	c7 04 24 37 37 10 00 	movl   $0x103737,(%esp)
  100887:	e8 8f fa ff ff       	call   10031b <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  10088c:	b8 80 fd 10 00       	mov    $0x10fd80,%eax
  100891:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  100897:	b8 00 00 10 00       	mov    $0x100000,%eax
  10089c:	89 d1                	mov    %edx,%ecx
  10089e:	29 c1                	sub    %eax,%ecx
  1008a0:	89 c8                	mov    %ecx,%eax
  1008a2:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008a8:	85 c0                	test   %eax,%eax
  1008aa:	0f 48 c2             	cmovs  %edx,%eax
  1008ad:	c1 f8 0a             	sar    $0xa,%eax
  1008b0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008b4:	c7 04 24 50 37 10 00 	movl   $0x103750,(%esp)
  1008bb:	e8 5b fa ff ff       	call   10031b <cprintf>
}
  1008c0:	c9                   	leave  
  1008c1:	c3                   	ret    

001008c2 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008c2:	55                   	push   %ebp
  1008c3:	89 e5                	mov    %esp,%ebp
  1008c5:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008cb:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008ce:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1008d5:	89 04 24             	mov    %eax,(%esp)
  1008d8:	e8 2d fc ff ff       	call   10050a <debuginfo_eip>
  1008dd:	85 c0                	test   %eax,%eax
  1008df:	74 15                	je     1008f6 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008e8:	c7 04 24 7a 37 10 00 	movl   $0x10377a,(%esp)
  1008ef:	e8 27 fa ff ff       	call   10031b <cprintf>
  1008f4:	eb 69                	jmp    10095f <print_debuginfo+0x9d>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1008f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1008fd:	eb 1a                	jmp    100919 <print_debuginfo+0x57>
            fnname[j] = info.eip_fn_name[j];
  1008ff:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100902:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100905:	01 d0                	add    %edx,%eax
  100907:	0f b6 10             	movzbl (%eax),%edx
  10090a:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  100910:	03 45 f4             	add    -0xc(%ebp),%eax
  100913:	88 10                	mov    %dl,(%eax)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100915:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100919:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10091c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10091f:	7f de                	jg     1008ff <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100921:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  100927:	03 45 f4             	add    -0xc(%ebp),%eax
  10092a:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10092d:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100930:	8b 55 08             	mov    0x8(%ebp),%edx
  100933:	89 d1                	mov    %edx,%ecx
  100935:	29 c1                	sub    %eax,%ecx
  100937:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10093a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10093d:	89 4c 24 10          	mov    %ecx,0x10(%esp)
                fnname, eip - info.eip_fn_addr);
  100941:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100947:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10094f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100953:	c7 04 24 96 37 10 00 	movl   $0x103796,(%esp)
  10095a:	e8 bc f9 ff ff       	call   10031b <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10095f:	c9                   	leave  
  100960:	c3                   	ret    

00100961 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100961:	55                   	push   %ebp
  100962:	89 e5                	mov    %esp,%ebp
  100964:	53                   	push   %ebx
  100965:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100968:	8b 5d 04             	mov    0x4(%ebp),%ebx
  10096b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
    return eip;
  10096e:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  100971:	83 c4 10             	add    $0x10,%esp
  100974:	5b                   	pop    %ebx
  100975:	5d                   	pop    %ebp
  100976:	c3                   	ret    

00100977 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100977:	55                   	push   %ebp
  100978:	89 e5                	mov    %esp,%ebp
  10097a:	53                   	push   %ebx
  10097b:	83 ec 34             	sub    $0x34,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  10097e:	89 eb                	mov    %ebp,%ebx
  100980:	89 5d e0             	mov    %ebx,-0x20(%ebp)
    return ebp;
  100983:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();
  100986:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100989:	e8 d3 ff ff ff       	call   100961 <read_eip>
  10098e:	89 45 f0             	mov    %eax,-0x10(%ebp)

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100991:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100998:	e9 82 00 00 00       	jmp    100a1f <print_stackframe+0xa8>
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  10099d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009a0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ab:	c7 04 24 a8 37 10 00 	movl   $0x1037a8,(%esp)
  1009b2:	e8 64 f9 ff ff       	call   10031b <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2;
  1009b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ba:	83 c0 08             	add    $0x8,%eax
  1009bd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for (j = 0; j < 4; j ++) {
  1009c0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009c7:	eb 1f                	jmp    1009e8 <print_stackframe+0x71>
            cprintf("0x%08x ", args[j]);
  1009c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009cc:	c1 e0 02             	shl    $0x2,%eax
  1009cf:	03 45 e4             	add    -0x1c(%ebp),%eax
  1009d2:	8b 00                	mov    (%eax),%eax
  1009d4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009d8:	c7 04 24 c4 37 10 00 	movl   $0x1037c4,(%esp)
  1009df:	e8 37 f9 ff ff       	call   10031b <cprintf>

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
        cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
        uint32_t *args = (uint32_t *)ebp + 2;
        for (j = 0; j < 4; j ++) {
  1009e4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  1009e8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  1009ec:	7e db                	jle    1009c9 <print_stackframe+0x52>
            cprintf("0x%08x ", args[j]);
        }
        cprintf("\n");
  1009ee:	c7 04 24 cc 37 10 00 	movl   $0x1037cc,(%esp)
  1009f5:	e8 21 f9 ff ff       	call   10031b <cprintf>
        print_debuginfo(eip - 1);
  1009fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009fd:	83 e8 01             	sub    $0x1,%eax
  100a00:	89 04 24             	mov    %eax,(%esp)
  100a03:	e8 ba fe ff ff       	call   1008c2 <print_debuginfo>
        eip = ((uint32_t *)ebp)[1];
  100a08:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a0b:	83 c0 04             	add    $0x4,%eax
  100a0e:	8b 00                	mov    (%eax),%eax
  100a10:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t *)ebp)[0];
  100a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a16:	8b 00                	mov    (%eax),%eax
  100a18:	89 45 f4             	mov    %eax,-0xc(%ebp)
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t ebp = read_ebp(), eip = read_eip();

    int i, j;
    for (i = 0; ebp != 0 && i < STACKFRAME_DEPTH; i ++) {
  100a1b:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a23:	74 0a                	je     100a2f <print_stackframe+0xb8>
  100a25:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a29:	0f 8e 6e ff ff ff    	jle    10099d <print_stackframe+0x26>
        cprintf("\n");
        print_debuginfo(eip - 1);
        eip = ((uint32_t *)ebp)[1];
        ebp = ((uint32_t *)ebp)[0];
    }
}
  100a2f:	83 c4 34             	add    $0x34,%esp
  100a32:	5b                   	pop    %ebx
  100a33:	5d                   	pop    %ebp
  100a34:	c3                   	ret    
  100a35:	00 00                	add    %al,(%eax)
	...

00100a38 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a38:	55                   	push   %ebp
  100a39:	89 e5                	mov    %esp,%ebp
  100a3b:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a3e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a45:	eb 0d                	jmp    100a54 <parse+0x1c>
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
  100a47:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a48:	eb 0a                	jmp    100a54 <parse+0x1c>
            *buf ++ = '\0';
  100a4a:	8b 45 08             	mov    0x8(%ebp),%eax
  100a4d:	c6 00 00             	movb   $0x0,(%eax)
  100a50:	83 45 08 01          	addl   $0x1,0x8(%ebp)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a54:	8b 45 08             	mov    0x8(%ebp),%eax
  100a57:	0f b6 00             	movzbl (%eax),%eax
  100a5a:	84 c0                	test   %al,%al
  100a5c:	74 1d                	je     100a7b <parse+0x43>
  100a5e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a61:	0f b6 00             	movzbl (%eax),%eax
  100a64:	0f be c0             	movsbl %al,%eax
  100a67:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a6b:	c7 04 24 50 38 10 00 	movl   $0x103850,(%esp)
  100a72:	e8 35 28 00 00       	call   1032ac <strchr>
  100a77:	85 c0                	test   %eax,%eax
  100a79:	75 cf                	jne    100a4a <parse+0x12>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a7e:	0f b6 00             	movzbl (%eax),%eax
  100a81:	84 c0                	test   %al,%al
  100a83:	74 5e                	je     100ae3 <parse+0xab>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a85:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a89:	75 14                	jne    100a9f <parse+0x67>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a8b:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100a92:	00 
  100a93:	c7 04 24 55 38 10 00 	movl   $0x103855,(%esp)
  100a9a:	e8 7c f8 ff ff       	call   10031b <cprintf>
        }
        argv[argc ++] = buf;
  100a9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aa2:	c1 e0 02             	shl    $0x2,%eax
  100aa5:	03 45 0c             	add    0xc(%ebp),%eax
  100aa8:	8b 55 08             	mov    0x8(%ebp),%edx
  100aab:	89 10                	mov    %edx,(%eax)
  100aad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ab1:	eb 04                	jmp    100ab7 <parse+0x7f>
            buf ++;
  100ab3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ab7:	8b 45 08             	mov    0x8(%ebp),%eax
  100aba:	0f b6 00             	movzbl (%eax),%eax
  100abd:	84 c0                	test   %al,%al
  100abf:	74 86                	je     100a47 <parse+0xf>
  100ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac4:	0f b6 00             	movzbl (%eax),%eax
  100ac7:	0f be c0             	movsbl %al,%eax
  100aca:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ace:	c7 04 24 50 38 10 00 	movl   $0x103850,(%esp)
  100ad5:	e8 d2 27 00 00       	call   1032ac <strchr>
  100ada:	85 c0                	test   %eax,%eax
  100adc:	74 d5                	je     100ab3 <parse+0x7b>
            buf ++;
        }
    }
  100ade:	e9 64 ff ff ff       	jmp    100a47 <parse+0xf>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100ae3:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100ae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100ae7:	c9                   	leave  
  100ae8:	c3                   	ret    

00100ae9 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100ae9:	55                   	push   %ebp
  100aea:	89 e5                	mov    %esp,%ebp
  100aec:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100aef:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100af2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100af6:	8b 45 08             	mov    0x8(%ebp),%eax
  100af9:	89 04 24             	mov    %eax,(%esp)
  100afc:	e8 37 ff ff ff       	call   100a38 <parse>
  100b01:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b04:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b08:	75 0a                	jne    100b14 <runcmd+0x2b>
        return 0;
  100b0a:	b8 00 00 00 00       	mov    $0x0,%eax
  100b0f:	e9 85 00 00 00       	jmp    100b99 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b1b:	eb 5c                	jmp    100b79 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b1d:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b20:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b23:	89 d0                	mov    %edx,%eax
  100b25:	01 c0                	add    %eax,%eax
  100b27:	01 d0                	add    %edx,%eax
  100b29:	c1 e0 02             	shl    $0x2,%eax
  100b2c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b31:	8b 00                	mov    (%eax),%eax
  100b33:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b37:	89 04 24             	mov    %eax,(%esp)
  100b3a:	e8 c8 26 00 00       	call   103207 <strcmp>
  100b3f:	85 c0                	test   %eax,%eax
  100b41:	75 32                	jne    100b75 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b43:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b46:	89 d0                	mov    %edx,%eax
  100b48:	01 c0                	add    %eax,%eax
  100b4a:	01 d0                	add    %edx,%eax
  100b4c:	c1 e0 02             	shl    $0x2,%eax
  100b4f:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b54:	8b 50 08             	mov    0x8(%eax),%edx
  100b57:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b5a:	8d 48 ff             	lea    -0x1(%eax),%ecx
  100b5d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b60:	89 44 24 08          	mov    %eax,0x8(%esp)
  100b64:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b67:	83 c0 04             	add    $0x4,%eax
  100b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b6e:	89 0c 24             	mov    %ecx,(%esp)
  100b71:	ff d2                	call   *%edx
  100b73:	eb 24                	jmp    100b99 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b75:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b7c:	83 f8 02             	cmp    $0x2,%eax
  100b7f:	76 9c                	jbe    100b1d <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b81:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b84:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b88:	c7 04 24 73 38 10 00 	movl   $0x103873,(%esp)
  100b8f:	e8 87 f7 ff ff       	call   10031b <cprintf>
    return 0;
  100b94:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b99:	c9                   	leave  
  100b9a:	c3                   	ret    

00100b9b <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b9b:	55                   	push   %ebp
  100b9c:	89 e5                	mov    %esp,%ebp
  100b9e:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100ba1:	c7 04 24 8c 38 10 00 	movl   $0x10388c,(%esp)
  100ba8:	e8 6e f7 ff ff       	call   10031b <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bad:	c7 04 24 b4 38 10 00 	movl   $0x1038b4,(%esp)
  100bb4:	e8 62 f7 ff ff       	call   10031b <cprintf>

    if (tf != NULL) {
  100bb9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bbd:	74 0e                	je     100bcd <kmonitor+0x32>
        print_trapframe(tf);
  100bbf:	8b 45 08             	mov    0x8(%ebp),%eax
  100bc2:	89 04 24             	mov    %eax,(%esp)
  100bc5:	e8 7e 0e 00 00       	call   101a48 <print_trapframe>
  100bca:	eb 01                	jmp    100bcd <kmonitor+0x32>
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
            }
        }
    }
  100bcc:	90                   	nop
        print_trapframe(tf);
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bcd:	c7 04 24 d9 38 10 00 	movl   $0x1038d9,(%esp)
  100bd4:	e8 33 f6 ff ff       	call   10020c <readline>
  100bd9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bdc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100be0:	74 ea                	je     100bcc <kmonitor+0x31>
            if (runcmd(buf, tf) < 0) {
  100be2:	8b 45 08             	mov    0x8(%ebp),%eax
  100be5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bec:	89 04 24             	mov    %eax,(%esp)
  100bef:	e8 f5 fe ff ff       	call   100ae9 <runcmd>
  100bf4:	85 c0                	test   %eax,%eax
  100bf6:	79 d4                	jns    100bcc <kmonitor+0x31>
                break;
  100bf8:	90                   	nop
            }
        }
    }
}
  100bf9:	c9                   	leave  
  100bfa:	c3                   	ret    

00100bfb <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100bfb:	55                   	push   %ebp
  100bfc:	89 e5                	mov    %esp,%ebp
  100bfe:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c01:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c08:	eb 3f                	jmp    100c49 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c0a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c0d:	89 d0                	mov    %edx,%eax
  100c0f:	01 c0                	add    %eax,%eax
  100c11:	01 d0                	add    %edx,%eax
  100c13:	c1 e0 02             	shl    $0x2,%eax
  100c16:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c1b:	8b 48 04             	mov    0x4(%eax),%ecx
  100c1e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c21:	89 d0                	mov    %edx,%eax
  100c23:	01 c0                	add    %eax,%eax
  100c25:	01 d0                	add    %edx,%eax
  100c27:	c1 e0 02             	shl    $0x2,%eax
  100c2a:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c2f:	8b 00                	mov    (%eax),%eax
  100c31:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c35:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c39:	c7 04 24 dd 38 10 00 	movl   $0x1038dd,(%esp)
  100c40:	e8 d6 f6 ff ff       	call   10031b <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c45:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c4c:	83 f8 02             	cmp    $0x2,%eax
  100c4f:	76 b9                	jbe    100c0a <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c51:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c56:	c9                   	leave  
  100c57:	c3                   	ret    

00100c58 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c58:	55                   	push   %ebp
  100c59:	89 e5                	mov    %esp,%ebp
  100c5b:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c5e:	e8 c7 fb ff ff       	call   10082a <print_kerninfo>
    return 0;
  100c63:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c68:	c9                   	leave  
  100c69:	c3                   	ret    

00100c6a <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c6a:	55                   	push   %ebp
  100c6b:	89 e5                	mov    %esp,%ebp
  100c6d:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c70:	e8 02 fd ff ff       	call   100977 <print_stackframe>
    return 0;
  100c75:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c7a:	c9                   	leave  
  100c7b:	c3                   	ret    

00100c7c <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c7c:	55                   	push   %ebp
  100c7d:	89 e5                	mov    %esp,%ebp
  100c7f:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c82:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100c87:	85 c0                	test   %eax,%eax
  100c89:	75 4c                	jne    100cd7 <__panic+0x5b>
        goto panic_dead;
    }
    is_panic = 1;
  100c8b:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100c92:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100c95:	8d 55 14             	lea    0x14(%ebp),%edx
  100c98:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100c9b:	89 10                	mov    %edx,(%eax)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ca0:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  100ca7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cab:	c7 04 24 e6 38 10 00 	movl   $0x1038e6,(%esp)
  100cb2:	e8 64 f6 ff ff       	call   10031b <cprintf>
    vcprintf(fmt, ap);
  100cb7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cba:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cbe:	8b 45 10             	mov    0x10(%ebp),%eax
  100cc1:	89 04 24             	mov    %eax,(%esp)
  100cc4:	e8 1f f6 ff ff       	call   1002e8 <vcprintf>
    cprintf("\n");
  100cc9:	c7 04 24 02 39 10 00 	movl   $0x103902,(%esp)
  100cd0:	e8 46 f6 ff ff       	call   10031b <cprintf>
  100cd5:	eb 01                	jmp    100cd8 <__panic+0x5c>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  100cd7:	90                   	nop
    vcprintf(fmt, ap);
    cprintf("\n");
    va_end(ap);

panic_dead:
    intr_disable();
  100cd8:	e8 c9 09 00 00       	call   1016a6 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cdd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100ce4:	e8 b2 fe ff ff       	call   100b9b <kmonitor>
    }
  100ce9:	eb f2                	jmp    100cdd <__panic+0x61>

00100ceb <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100ceb:	55                   	push   %ebp
  100cec:	89 e5                	mov    %esp,%ebp
  100cee:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100cf1:	8d 55 14             	lea    0x14(%ebp),%edx
  100cf4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100cf7:	89 10                	mov    %edx,(%eax)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100cf9:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cfc:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d00:	8b 45 08             	mov    0x8(%ebp),%eax
  100d03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d07:	c7 04 24 04 39 10 00 	movl   $0x103904,(%esp)
  100d0e:	e8 08 f6 ff ff       	call   10031b <cprintf>
    vcprintf(fmt, ap);
  100d13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d16:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1a:	8b 45 10             	mov    0x10(%ebp),%eax
  100d1d:	89 04 24             	mov    %eax,(%esp)
  100d20:	e8 c3 f5 ff ff       	call   1002e8 <vcprintf>
    cprintf("\n");
  100d25:	c7 04 24 02 39 10 00 	movl   $0x103902,(%esp)
  100d2c:	e8 ea f5 ff ff       	call   10031b <cprintf>
    va_end(ap);
}
  100d31:	c9                   	leave  
  100d32:	c3                   	ret    

00100d33 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d33:	55                   	push   %ebp
  100d34:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d36:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d3b:	5d                   	pop    %ebp
  100d3c:	c3                   	ret    
  100d3d:	00 00                	add    %al,(%eax)
	...

00100d40 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d40:	55                   	push   %ebp
  100d41:	89 e5                	mov    %esp,%ebp
  100d43:	83 ec 28             	sub    $0x28,%esp
  100d46:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d4c:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d50:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d54:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d58:	ee                   	out    %al,(%dx)
  100d59:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d5f:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d63:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d67:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d6b:	ee                   	out    %al,(%dx)
  100d6c:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d72:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d76:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d7a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d7e:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d7f:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d86:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d89:	c7 04 24 22 39 10 00 	movl   $0x103922,(%esp)
  100d90:	e8 86 f5 ff ff       	call   10031b <cprintf>
    pic_enable(IRQ_TIMER);
  100d95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d9c:	e8 63 09 00 00       	call   101704 <pic_enable>
}
  100da1:	c9                   	leave  
  100da2:	c3                   	ret    
	...

00100da4 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100da4:	55                   	push   %ebp
  100da5:	89 e5                	mov    %esp,%ebp
  100da7:	53                   	push   %ebx
  100da8:	83 ec 14             	sub    $0x14,%esp
  100dab:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100db1:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100db5:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100db9:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100dbd:	ec                   	in     (%dx),%al
  100dbe:	89 c3                	mov    %eax,%ebx
  100dc0:	88 5d f9             	mov    %bl,-0x7(%ebp)
    return data;
  100dc3:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc9:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100dcd:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100dd1:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100dd5:	ec                   	in     (%dx),%al
  100dd6:	89 c3                	mov    %eax,%ebx
  100dd8:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  100ddb:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100de1:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100de5:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100de9:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ded:	ec                   	in     (%dx),%al
  100dee:	89 c3                	mov    %eax,%ebx
  100df0:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  100df3:	66 c7 45 ee 84 00    	movw   $0x84,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100df9:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dfd:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  100e01:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e05:	ec                   	in     (%dx),%al
  100e06:	89 c3                	mov    %eax,%ebx
  100e08:	88 5d ed             	mov    %bl,-0x13(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e0b:	83 c4 14             	add    $0x14,%esp
  100e0e:	5b                   	pop    %ebx
  100e0f:	5d                   	pop    %ebp
  100e10:	c3                   	ret    

00100e11 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e11:	55                   	push   %ebp
  100e12:	89 e5                	mov    %esp,%ebp
  100e14:	53                   	push   %ebx
  100e15:	83 ec 24             	sub    $0x24,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e18:	c7 45 f8 00 80 0b 00 	movl   $0xb8000,-0x8(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e1f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e22:	0f b7 00             	movzwl (%eax),%eax
  100e25:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e29:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e2c:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e31:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e34:	0f b7 00             	movzwl (%eax),%eax
  100e37:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e3b:	74 12                	je     100e4f <cga_init+0x3e>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e3d:	c7 45 f8 00 00 0b 00 	movl   $0xb0000,-0x8(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e44:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e4b:	b4 03 
  100e4d:	eb 13                	jmp    100e62 <cga_init+0x51>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e4f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e52:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e56:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e59:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e60:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e62:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e69:	0f b7 c0             	movzwl %ax,%eax
  100e6c:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100e70:	c6 45 ed 0e          	movb   $0xe,-0x13(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e74:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e78:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e7c:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e7d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e84:	83 c0 01             	add    $0x1,%eax
  100e87:	0f b7 c0             	movzwl %ax,%eax
  100e8a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e8e:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e92:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100e96:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100e9a:	ec                   	in     (%dx),%al
  100e9b:	89 c3                	mov    %eax,%ebx
  100e9d:	88 5d e9             	mov    %bl,-0x17(%ebp)
    return data;
  100ea0:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ea4:	0f b6 c0             	movzbl %al,%eax
  100ea7:	c1 e0 08             	shl    $0x8,%eax
  100eaa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    outb(addr_6845, 15);
  100ead:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eb4:	0f b7 c0             	movzwl %ax,%eax
  100eb7:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ebb:	c6 45 e5 0f          	movb   $0xf,-0x1b(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ebf:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ec3:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ec7:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ec8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ecf:	83 c0 01             	add    $0x1,%eax
  100ed2:	0f b7 c0             	movzwl %ax,%eax
  100ed5:	66 89 45 e2          	mov    %ax,-0x1e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ed9:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100edd:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  100ee1:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100ee5:	ec                   	in     (%dx),%al
  100ee6:	89 c3                	mov    %eax,%ebx
  100ee8:	88 5d e1             	mov    %bl,-0x1f(%ebp)
    return data;
  100eeb:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100eef:	0f b6 c0             	movzbl %al,%eax
  100ef2:	09 45 f0             	or     %eax,-0x10(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ef5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100ef8:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100efd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100f00:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100f06:	83 c4 24             	add    $0x24,%esp
  100f09:	5b                   	pop    %ebx
  100f0a:	5d                   	pop    %ebp
  100f0b:	c3                   	ret    

00100f0c <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f0c:	55                   	push   %ebp
  100f0d:	89 e5                	mov    %esp,%ebp
  100f0f:	53                   	push   %ebx
  100f10:	83 ec 54             	sub    $0x54,%esp
  100f13:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f19:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f1d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f21:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f25:	ee                   	out    %al,(%dx)
  100f26:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f2c:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f30:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f34:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f38:	ee                   	out    %al,(%dx)
  100f39:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f3f:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f43:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f47:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f4b:	ee                   	out    %al,(%dx)
  100f4c:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f52:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f56:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f5a:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f5e:	ee                   	out    %al,(%dx)
  100f5f:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f65:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f69:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f6d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f71:	ee                   	out    %al,(%dx)
  100f72:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f78:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f7c:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f80:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f84:	ee                   	out    %al,(%dx)
  100f85:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f8b:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f8f:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f93:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f97:	ee                   	out    %al,(%dx)
  100f98:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f9e:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fa2:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100fa6:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100faa:	ec                   	in     (%dx),%al
  100fab:	89 c3                	mov    %eax,%ebx
  100fad:	88 5d d9             	mov    %bl,-0x27(%ebp)
    return data;
  100fb0:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fb4:	3c ff                	cmp    $0xff,%al
  100fb6:	0f 95 c0             	setne  %al
  100fb9:	0f b6 c0             	movzbl %al,%eax
  100fbc:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fc1:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fc7:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100fcb:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100fcf:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100fd3:	ec                   	in     (%dx),%al
  100fd4:	89 c3                	mov    %eax,%ebx
  100fd6:	88 5d d5             	mov    %bl,-0x2b(%ebp)
    return data;
  100fd9:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fdf:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100fe3:	66 89 55 c6          	mov    %dx,-0x3a(%ebp)
  100fe7:	0f b7 55 c6          	movzwl -0x3a(%ebp),%edx
  100feb:	ec                   	in     (%dx),%al
  100fec:	89 c3                	mov    %eax,%ebx
  100fee:	88 5d d1             	mov    %bl,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100ff1:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100ff6:	85 c0                	test   %eax,%eax
  100ff8:	74 0c                	je     101006 <serial_init+0xfa>
        pic_enable(IRQ_COM1);
  100ffa:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101001:	e8 fe 06 00 00       	call   101704 <pic_enable>
    }
}
  101006:	83 c4 54             	add    $0x54,%esp
  101009:	5b                   	pop    %ebx
  10100a:	5d                   	pop    %ebp
  10100b:	c3                   	ret    

0010100c <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10100c:	55                   	push   %ebp
  10100d:	89 e5                	mov    %esp,%ebp
  10100f:	53                   	push   %ebx
  101010:	83 ec 24             	sub    $0x24,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101013:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10101a:	eb 09                	jmp    101025 <lpt_putc_sub+0x19>
        delay();
  10101c:	e8 83 fd ff ff       	call   100da4 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101021:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  101025:	66 c7 45 f6 79 03    	movw   $0x379,-0xa(%ebp)
  10102b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10102f:	66 89 55 da          	mov    %dx,-0x26(%ebp)
  101033:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101037:	ec                   	in     (%dx),%al
  101038:	89 c3                	mov    %eax,%ebx
  10103a:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  10103d:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101041:	84 c0                	test   %al,%al
  101043:	78 09                	js     10104e <lpt_putc_sub+0x42>
  101045:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  10104c:	7e ce                	jle    10101c <lpt_putc_sub+0x10>
        delay();
    }
    outb(LPTPORT + 0, c);
  10104e:	8b 45 08             	mov    0x8(%ebp),%eax
  101051:	0f b6 c0             	movzbl %al,%eax
  101054:	66 c7 45 f2 78 03    	movw   $0x378,-0xe(%ebp)
  10105a:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10105d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101061:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101065:	ee                   	out    %al,(%dx)
  101066:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  10106c:	c6 45 ed 0d          	movb   $0xd,-0x13(%ebp)
  101070:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101074:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101078:	ee                   	out    %al,(%dx)
  101079:	66 c7 45 ea 7a 03    	movw   $0x37a,-0x16(%ebp)
  10107f:	c6 45 e9 08          	movb   $0x8,-0x17(%ebp)
  101083:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101087:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10108b:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10108c:	83 c4 24             	add    $0x24,%esp
  10108f:	5b                   	pop    %ebx
  101090:	5d                   	pop    %ebp
  101091:	c3                   	ret    

00101092 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101092:	55                   	push   %ebp
  101093:	89 e5                	mov    %esp,%ebp
  101095:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101098:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10109c:	74 0d                	je     1010ab <lpt_putc+0x19>
        lpt_putc_sub(c);
  10109e:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a1:	89 04 24             	mov    %eax,(%esp)
  1010a4:	e8 63 ff ff ff       	call   10100c <lpt_putc_sub>
  1010a9:	eb 24                	jmp    1010cf <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  1010ab:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010b2:	e8 55 ff ff ff       	call   10100c <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010b7:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010be:	e8 49 ff ff ff       	call   10100c <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010c3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010ca:	e8 3d ff ff ff       	call   10100c <lpt_putc_sub>
    }
}
  1010cf:	c9                   	leave  
  1010d0:	c3                   	ret    

001010d1 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010d1:	55                   	push   %ebp
  1010d2:	89 e5                	mov    %esp,%ebp
  1010d4:	53                   	push   %ebx
  1010d5:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1010d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010db:	b0 00                	mov    $0x0,%al
  1010dd:	85 c0                	test   %eax,%eax
  1010df:	75 07                	jne    1010e8 <cga_putc+0x17>
        c |= 0x0700;
  1010e1:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1010eb:	25 ff 00 00 00       	and    $0xff,%eax
  1010f0:	83 f8 0a             	cmp    $0xa,%eax
  1010f3:	74 4e                	je     101143 <cga_putc+0x72>
  1010f5:	83 f8 0d             	cmp    $0xd,%eax
  1010f8:	74 59                	je     101153 <cga_putc+0x82>
  1010fa:	83 f8 08             	cmp    $0x8,%eax
  1010fd:	0f 85 8c 00 00 00    	jne    10118f <cga_putc+0xbe>
    case '\b':
        if (crt_pos > 0) {
  101103:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10110a:	66 85 c0             	test   %ax,%ax
  10110d:	0f 84 a1 00 00 00    	je     1011b4 <cga_putc+0xe3>
            crt_pos --;
  101113:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10111a:	83 e8 01             	sub    $0x1,%eax
  10111d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101123:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101128:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  10112f:	0f b7 d2             	movzwl %dx,%edx
  101132:	01 d2                	add    %edx,%edx
  101134:	01 c2                	add    %eax,%edx
  101136:	8b 45 08             	mov    0x8(%ebp),%eax
  101139:	b0 00                	mov    $0x0,%al
  10113b:	83 c8 20             	or     $0x20,%eax
  10113e:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101141:	eb 71                	jmp    1011b4 <cga_putc+0xe3>
    case '\n':
        crt_pos += CRT_COLS;
  101143:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10114a:	83 c0 50             	add    $0x50,%eax
  10114d:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101153:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10115a:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101161:	0f b7 c1             	movzwl %cx,%eax
  101164:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10116a:	c1 e8 10             	shr    $0x10,%eax
  10116d:	89 c2                	mov    %eax,%edx
  10116f:	66 c1 ea 06          	shr    $0x6,%dx
  101173:	89 d0                	mov    %edx,%eax
  101175:	c1 e0 02             	shl    $0x2,%eax
  101178:	01 d0                	add    %edx,%eax
  10117a:	c1 e0 04             	shl    $0x4,%eax
  10117d:	89 ca                	mov    %ecx,%edx
  10117f:	66 29 c2             	sub    %ax,%dx
  101182:	89 d8                	mov    %ebx,%eax
  101184:	66 29 d0             	sub    %dx,%ax
  101187:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10118d:	eb 26                	jmp    1011b5 <cga_putc+0xe4>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10118f:	8b 15 60 ee 10 00    	mov    0x10ee60,%edx
  101195:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10119c:	0f b7 c8             	movzwl %ax,%ecx
  10119f:	01 c9                	add    %ecx,%ecx
  1011a1:	01 d1                	add    %edx,%ecx
  1011a3:	8b 55 08             	mov    0x8(%ebp),%edx
  1011a6:	66 89 11             	mov    %dx,(%ecx)
  1011a9:	83 c0 01             	add    $0x1,%eax
  1011ac:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  1011b2:	eb 01                	jmp    1011b5 <cga_putc+0xe4>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  1011b4:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1011b5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011bc:	66 3d cf 07          	cmp    $0x7cf,%ax
  1011c0:	76 5b                	jbe    10121d <cga_putc+0x14c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011c2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011c7:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011cd:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011d2:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011d9:	00 
  1011da:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011de:	89 04 24             	mov    %eax,(%esp)
  1011e1:	e8 cc 22 00 00       	call   1034b2 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011e6:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011ed:	eb 15                	jmp    101204 <cga_putc+0x133>
            crt_buf[i] = 0x0700 | ' ';
  1011ef:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011f7:	01 d2                	add    %edx,%edx
  1011f9:	01 d0                	add    %edx,%eax
  1011fb:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101200:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101204:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  10120b:	7e e2                	jle    1011ef <cga_putc+0x11e>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  10120d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101214:	83 e8 50             	sub    $0x50,%eax
  101217:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10121d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101224:	0f b7 c0             	movzwl %ax,%eax
  101227:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10122b:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  10122f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101233:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101237:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  101238:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10123f:	66 c1 e8 08          	shr    $0x8,%ax
  101243:	0f b6 c0             	movzbl %al,%eax
  101246:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10124d:	83 c2 01             	add    $0x1,%edx
  101250:	0f b7 d2             	movzwl %dx,%edx
  101253:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  101257:	88 45 ed             	mov    %al,-0x13(%ebp)
  10125a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10125e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101262:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101263:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10126a:	0f b7 c0             	movzwl %ax,%eax
  10126d:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101271:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101275:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101279:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10127d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10127e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101285:	0f b6 c0             	movzbl %al,%eax
  101288:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10128f:	83 c2 01             	add    $0x1,%edx
  101292:	0f b7 d2             	movzwl %dx,%edx
  101295:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101299:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10129c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1012a0:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1012a4:	ee                   	out    %al,(%dx)
}
  1012a5:	83 c4 34             	add    $0x34,%esp
  1012a8:	5b                   	pop    %ebx
  1012a9:	5d                   	pop    %ebp
  1012aa:	c3                   	ret    

001012ab <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012ab:	55                   	push   %ebp
  1012ac:	89 e5                	mov    %esp,%ebp
  1012ae:	53                   	push   %ebx
  1012af:	83 ec 14             	sub    $0x14,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012b2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1012b9:	eb 09                	jmp    1012c4 <serial_putc_sub+0x19>
        delay();
  1012bb:	e8 e4 fa ff ff       	call   100da4 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1012c0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1012c4:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012ca:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012ce:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012d2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012d6:	ec                   	in     (%dx),%al
  1012d7:	89 c3                	mov    %eax,%ebx
  1012d9:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  1012dc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012e0:	0f b6 c0             	movzbl %al,%eax
  1012e3:	83 e0 20             	and    $0x20,%eax
  1012e6:	85 c0                	test   %eax,%eax
  1012e8:	75 09                	jne    1012f3 <serial_putc_sub+0x48>
  1012ea:	81 7d f8 ff 31 00 00 	cmpl   $0x31ff,-0x8(%ebp)
  1012f1:	7e c8                	jle    1012bb <serial_putc_sub+0x10>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1012f6:	0f b6 c0             	movzbl %al,%eax
  1012f9:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  1012ff:	88 45 f1             	mov    %al,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101302:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101306:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10130a:	ee                   	out    %al,(%dx)
}
  10130b:	83 c4 14             	add    $0x14,%esp
  10130e:	5b                   	pop    %ebx
  10130f:	5d                   	pop    %ebp
  101310:	c3                   	ret    

00101311 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101311:	55                   	push   %ebp
  101312:	89 e5                	mov    %esp,%ebp
  101314:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101317:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10131b:	74 0d                	je     10132a <serial_putc+0x19>
        serial_putc_sub(c);
  10131d:	8b 45 08             	mov    0x8(%ebp),%eax
  101320:	89 04 24             	mov    %eax,(%esp)
  101323:	e8 83 ff ff ff       	call   1012ab <serial_putc_sub>
  101328:	eb 24                	jmp    10134e <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  10132a:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101331:	e8 75 ff ff ff       	call   1012ab <serial_putc_sub>
        serial_putc_sub(' ');
  101336:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10133d:	e8 69 ff ff ff       	call   1012ab <serial_putc_sub>
        serial_putc_sub('\b');
  101342:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101349:	e8 5d ff ff ff       	call   1012ab <serial_putc_sub>
    }
}
  10134e:	c9                   	leave  
  10134f:	c3                   	ret    

00101350 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101350:	55                   	push   %ebp
  101351:	89 e5                	mov    %esp,%ebp
  101353:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101356:	eb 32                	jmp    10138a <cons_intr+0x3a>
        if (c != 0) {
  101358:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10135c:	74 2c                	je     10138a <cons_intr+0x3a>
            cons.buf[cons.wpos ++] = c;
  10135e:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101363:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101366:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
  10136c:	83 c0 01             	add    $0x1,%eax
  10136f:	a3 84 f0 10 00       	mov    %eax,0x10f084
            if (cons.wpos == CONSBUFSIZE) {
  101374:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101379:	3d 00 02 00 00       	cmp    $0x200,%eax
  10137e:	75 0a                	jne    10138a <cons_intr+0x3a>
                cons.wpos = 0;
  101380:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101387:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10138a:	8b 45 08             	mov    0x8(%ebp),%eax
  10138d:	ff d0                	call   *%eax
  10138f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101392:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101396:	75 c0                	jne    101358 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101398:	c9                   	leave  
  101399:	c3                   	ret    

0010139a <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10139a:	55                   	push   %ebp
  10139b:	89 e5                	mov    %esp,%ebp
  10139d:	53                   	push   %ebx
  10139e:	83 ec 14             	sub    $0x14,%esp
  1013a1:	66 c7 45 f6 fd 03    	movw   $0x3fd,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013a7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1013ab:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1013af:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1013b3:	ec                   	in     (%dx),%al
  1013b4:	89 c3                	mov    %eax,%ebx
  1013b6:	88 5d f5             	mov    %bl,-0xb(%ebp)
    return data;
  1013b9:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  1013bd:	0f b6 c0             	movzbl %al,%eax
  1013c0:	83 e0 01             	and    $0x1,%eax
  1013c3:	85 c0                	test   %eax,%eax
  1013c5:	75 07                	jne    1013ce <serial_proc_data+0x34>
        return -1;
  1013c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013cc:	eb 32                	jmp    101400 <serial_proc_data+0x66>
  1013ce:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013d4:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1013d8:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1013dc:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1013e0:	ec                   	in     (%dx),%al
  1013e1:	89 c3                	mov    %eax,%ebx
  1013e3:	88 5d f1             	mov    %bl,-0xf(%ebp)
    return data;
  1013e6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013ea:	0f b6 c0             	movzbl %al,%eax
  1013ed:	89 45 f8             	mov    %eax,-0x8(%ebp)
    if (c == 127) {
  1013f0:	83 7d f8 7f          	cmpl   $0x7f,-0x8(%ebp)
  1013f4:	75 07                	jne    1013fd <serial_proc_data+0x63>
        c = '\b';
  1013f6:	c7 45 f8 08 00 00 00 	movl   $0x8,-0x8(%ebp)
    }
    return c;
  1013fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  101400:	83 c4 14             	add    $0x14,%esp
  101403:	5b                   	pop    %ebx
  101404:	5d                   	pop    %ebp
  101405:	c3                   	ret    

00101406 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101406:	55                   	push   %ebp
  101407:	89 e5                	mov    %esp,%ebp
  101409:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10140c:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101411:	85 c0                	test   %eax,%eax
  101413:	74 0c                	je     101421 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  101415:	c7 04 24 9a 13 10 00 	movl   $0x10139a,(%esp)
  10141c:	e8 2f ff ff ff       	call   101350 <cons_intr>
    }
}
  101421:	c9                   	leave  
  101422:	c3                   	ret    

00101423 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101423:	55                   	push   %ebp
  101424:	89 e5                	mov    %esp,%ebp
  101426:	53                   	push   %ebx
  101427:	83 ec 44             	sub    $0x44,%esp
  10142a:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101430:	0f b7 55 f0          	movzwl -0x10(%ebp),%edx
  101434:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  101438:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10143c:	ec                   	in     (%dx),%al
  10143d:	89 c3                	mov    %eax,%ebx
  10143f:	88 5d ef             	mov    %bl,-0x11(%ebp)
    return data;
  101442:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101446:	0f b6 c0             	movzbl %al,%eax
  101449:	83 e0 01             	and    $0x1,%eax
  10144c:	85 c0                	test   %eax,%eax
  10144e:	75 0a                	jne    10145a <kbd_proc_data+0x37>
        return -1;
  101450:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101455:	e9 61 01 00 00       	jmp    1015bb <kbd_proc_data+0x198>
  10145a:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101460:	0f b7 55 ec          	movzwl -0x14(%ebp),%edx
  101464:	66 89 55 d6          	mov    %dx,-0x2a(%ebp)
  101468:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  10146c:	ec                   	in     (%dx),%al
  10146d:	89 c3                	mov    %eax,%ebx
  10146f:	88 5d eb             	mov    %bl,-0x15(%ebp)
    return data;
  101472:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101476:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101479:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10147d:	75 17                	jne    101496 <kbd_proc_data+0x73>
        // E0 escape character
        shift |= E0ESC;
  10147f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101484:	83 c8 40             	or     $0x40,%eax
  101487:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10148c:	b8 00 00 00 00       	mov    $0x0,%eax
  101491:	e9 25 01 00 00       	jmp    1015bb <kbd_proc_data+0x198>
    } else if (data & 0x80) {
  101496:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10149a:	84 c0                	test   %al,%al
  10149c:	79 47                	jns    1014e5 <kbd_proc_data+0xc2>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10149e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a3:	83 e0 40             	and    $0x40,%eax
  1014a6:	85 c0                	test   %eax,%eax
  1014a8:	75 09                	jne    1014b3 <kbd_proc_data+0x90>
  1014aa:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ae:	83 e0 7f             	and    $0x7f,%eax
  1014b1:	eb 04                	jmp    1014b7 <kbd_proc_data+0x94>
  1014b3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014b7:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014be:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014c5:	83 c8 40             	or     $0x40,%eax
  1014c8:	0f b6 c0             	movzbl %al,%eax
  1014cb:	f7 d0                	not    %eax
  1014cd:	89 c2                	mov    %eax,%edx
  1014cf:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d4:	21 d0                	and    %edx,%eax
  1014d6:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  1014db:	b8 00 00 00 00       	mov    $0x0,%eax
  1014e0:	e9 d6 00 00 00       	jmp    1015bb <kbd_proc_data+0x198>
    } else if (shift & E0ESC) {
  1014e5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ea:	83 e0 40             	and    $0x40,%eax
  1014ed:	85 c0                	test   %eax,%eax
  1014ef:	74 11                	je     101502 <kbd_proc_data+0xdf>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1014f1:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1014f5:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014fa:	83 e0 bf             	and    $0xffffffbf,%eax
  1014fd:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101502:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101506:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10150d:	0f b6 d0             	movzbl %al,%edx
  101510:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101515:	09 d0                	or     %edx,%eax
  101517:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  10151c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101520:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  101527:	0f b6 d0             	movzbl %al,%edx
  10152a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10152f:	31 d0                	xor    %edx,%eax
  101531:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  101536:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10153b:	83 e0 03             	and    $0x3,%eax
  10153e:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101545:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101549:	01 d0                	add    %edx,%eax
  10154b:	0f b6 00             	movzbl (%eax),%eax
  10154e:	0f b6 c0             	movzbl %al,%eax
  101551:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101554:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101559:	83 e0 08             	and    $0x8,%eax
  10155c:	85 c0                	test   %eax,%eax
  10155e:	74 22                	je     101582 <kbd_proc_data+0x15f>
        if ('a' <= c && c <= 'z')
  101560:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101564:	7e 0c                	jle    101572 <kbd_proc_data+0x14f>
  101566:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10156a:	7f 06                	jg     101572 <kbd_proc_data+0x14f>
            c += 'A' - 'a';
  10156c:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101570:	eb 10                	jmp    101582 <kbd_proc_data+0x15f>
        else if ('A' <= c && c <= 'Z')
  101572:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101576:	7e 0a                	jle    101582 <kbd_proc_data+0x15f>
  101578:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10157c:	7f 04                	jg     101582 <kbd_proc_data+0x15f>
            c += 'a' - 'A';
  10157e:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101582:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101587:	f7 d0                	not    %eax
  101589:	83 e0 06             	and    $0x6,%eax
  10158c:	85 c0                	test   %eax,%eax
  10158e:	75 28                	jne    1015b8 <kbd_proc_data+0x195>
  101590:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101597:	75 1f                	jne    1015b8 <kbd_proc_data+0x195>
        cprintf("Rebooting!\n");
  101599:	c7 04 24 3d 39 10 00 	movl   $0x10393d,(%esp)
  1015a0:	e8 76 ed ff ff       	call   10031b <cprintf>
  1015a5:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015ab:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015b3:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  1015b7:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015bb:	83 c4 44             	add    $0x44,%esp
  1015be:	5b                   	pop    %ebx
  1015bf:	5d                   	pop    %ebp
  1015c0:	c3                   	ret    

001015c1 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015c1:	55                   	push   %ebp
  1015c2:	89 e5                	mov    %esp,%ebp
  1015c4:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015c7:	c7 04 24 23 14 10 00 	movl   $0x101423,(%esp)
  1015ce:	e8 7d fd ff ff       	call   101350 <cons_intr>
}
  1015d3:	c9                   	leave  
  1015d4:	c3                   	ret    

001015d5 <kbd_init>:

static void
kbd_init(void) {
  1015d5:	55                   	push   %ebp
  1015d6:	89 e5                	mov    %esp,%ebp
  1015d8:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  1015db:	e8 e1 ff ff ff       	call   1015c1 <kbd_intr>
    pic_enable(IRQ_KBD);
  1015e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1015e7:	e8 18 01 00 00       	call   101704 <pic_enable>
}
  1015ec:	c9                   	leave  
  1015ed:	c3                   	ret    

001015ee <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1015ee:	55                   	push   %ebp
  1015ef:	89 e5                	mov    %esp,%ebp
  1015f1:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1015f4:	e8 18 f8 ff ff       	call   100e11 <cga_init>
    serial_init();
  1015f9:	e8 0e f9 ff ff       	call   100f0c <serial_init>
    kbd_init();
  1015fe:	e8 d2 ff ff ff       	call   1015d5 <kbd_init>
    if (!serial_exists) {
  101603:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101608:	85 c0                	test   %eax,%eax
  10160a:	75 0c                	jne    101618 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10160c:	c7 04 24 49 39 10 00 	movl   $0x103949,(%esp)
  101613:	e8 03 ed ff ff       	call   10031b <cprintf>
    }
}
  101618:	c9                   	leave  
  101619:	c3                   	ret    

0010161a <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10161a:	55                   	push   %ebp
  10161b:	89 e5                	mov    %esp,%ebp
  10161d:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101620:	8b 45 08             	mov    0x8(%ebp),%eax
  101623:	89 04 24             	mov    %eax,(%esp)
  101626:	e8 67 fa ff ff       	call   101092 <lpt_putc>
    cga_putc(c);
  10162b:	8b 45 08             	mov    0x8(%ebp),%eax
  10162e:	89 04 24             	mov    %eax,(%esp)
  101631:	e8 9b fa ff ff       	call   1010d1 <cga_putc>
    serial_putc(c);
  101636:	8b 45 08             	mov    0x8(%ebp),%eax
  101639:	89 04 24             	mov    %eax,(%esp)
  10163c:	e8 d0 fc ff ff       	call   101311 <serial_putc>
}
  101641:	c9                   	leave  
  101642:	c3                   	ret    

00101643 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101643:	55                   	push   %ebp
  101644:	89 e5                	mov    %esp,%ebp
  101646:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101649:	e8 b8 fd ff ff       	call   101406 <serial_intr>
    kbd_intr();
  10164e:	e8 6e ff ff ff       	call   1015c1 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101653:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101659:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10165e:	39 c2                	cmp    %eax,%edx
  101660:	74 35                	je     101697 <cons_getc+0x54>
        c = cons.buf[cons.rpos ++];
  101662:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101667:	0f b6 90 80 ee 10 00 	movzbl 0x10ee80(%eax),%edx
  10166e:	0f b6 d2             	movzbl %dl,%edx
  101671:	89 55 f4             	mov    %edx,-0xc(%ebp)
  101674:	83 c0 01             	add    $0x1,%eax
  101677:	a3 80 f0 10 00       	mov    %eax,0x10f080
        if (cons.rpos == CONSBUFSIZE) {
  10167c:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101681:	3d 00 02 00 00       	cmp    $0x200,%eax
  101686:	75 0a                	jne    101692 <cons_getc+0x4f>
            cons.rpos = 0;
  101688:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10168f:	00 00 00 
        }
        return c;
  101692:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101695:	eb 05                	jmp    10169c <cons_getc+0x59>
    }
    return 0;
  101697:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10169c:	c9                   	leave  
  10169d:	c3                   	ret    
	...

001016a0 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1016a0:	55                   	push   %ebp
  1016a1:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1016a3:	fb                   	sti    
    sti();
}
  1016a4:	5d                   	pop    %ebp
  1016a5:	c3                   	ret    

001016a6 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1016a6:	55                   	push   %ebp
  1016a7:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  1016a9:	fa                   	cli    
    cli();
}
  1016aa:	5d                   	pop    %ebp
  1016ab:	c3                   	ret    

001016ac <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016ac:	55                   	push   %ebp
  1016ad:	89 e5                	mov    %esp,%ebp
  1016af:	83 ec 14             	sub    $0x14,%esp
  1016b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1016b5:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016b9:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016bd:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  1016c3:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  1016c8:	85 c0                	test   %eax,%eax
  1016ca:	74 36                	je     101702 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  1016cc:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016d0:	0f b6 c0             	movzbl %al,%eax
  1016d3:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016d9:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016dc:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016e0:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016e4:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  1016e5:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1016e9:	66 c1 e8 08          	shr    $0x8,%ax
  1016ed:	0f b6 c0             	movzbl %al,%eax
  1016f0:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016f6:	88 45 f9             	mov    %al,-0x7(%ebp)
  1016f9:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016fd:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101701:	ee                   	out    %al,(%dx)
    }
}
  101702:	c9                   	leave  
  101703:	c3                   	ret    

00101704 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101704:	55                   	push   %ebp
  101705:	89 e5                	mov    %esp,%ebp
  101707:	53                   	push   %ebx
  101708:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10170b:	8b 45 08             	mov    0x8(%ebp),%eax
  10170e:	ba 01 00 00 00       	mov    $0x1,%edx
  101713:	89 d3                	mov    %edx,%ebx
  101715:	89 c1                	mov    %eax,%ecx
  101717:	d3 e3                	shl    %cl,%ebx
  101719:	89 d8                	mov    %ebx,%eax
  10171b:	89 c2                	mov    %eax,%edx
  10171d:	f7 d2                	not    %edx
  10171f:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101726:	21 d0                	and    %edx,%eax
  101728:	0f b7 c0             	movzwl %ax,%eax
  10172b:	89 04 24             	mov    %eax,(%esp)
  10172e:	e8 79 ff ff ff       	call   1016ac <pic_setmask>
}
  101733:	83 c4 04             	add    $0x4,%esp
  101736:	5b                   	pop    %ebx
  101737:	5d                   	pop    %ebp
  101738:	c3                   	ret    

00101739 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  101739:	55                   	push   %ebp
  10173a:	89 e5                	mov    %esp,%ebp
  10173c:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  10173f:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  101746:	00 00 00 
  101749:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10174f:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  101753:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101757:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10175b:	ee                   	out    %al,(%dx)
  10175c:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101762:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  101766:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10176a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10176e:	ee                   	out    %al,(%dx)
  10176f:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101775:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  101779:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10177d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101781:	ee                   	out    %al,(%dx)
  101782:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  101788:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  10178c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101790:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101794:	ee                   	out    %al,(%dx)
  101795:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  10179b:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  10179f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017a3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017a7:	ee                   	out    %al,(%dx)
  1017a8:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  1017ae:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  1017b2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1017b6:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1017ba:	ee                   	out    %al,(%dx)
  1017bb:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1017c1:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  1017c5:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1017c9:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017cd:	ee                   	out    %al,(%dx)
  1017ce:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  1017d4:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  1017d8:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017dc:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  1017e0:	ee                   	out    %al,(%dx)
  1017e1:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  1017e7:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  1017eb:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1017ef:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1017f3:	ee                   	out    %al,(%dx)
  1017f4:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  1017fa:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  1017fe:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101802:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101806:	ee                   	out    %al,(%dx)
  101807:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  10180d:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  101811:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101815:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101819:	ee                   	out    %al,(%dx)
  10181a:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101820:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  101824:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101828:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  10182c:	ee                   	out    %al,(%dx)
  10182d:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  101833:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  101837:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  10183b:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  10183f:	ee                   	out    %al,(%dx)
  101840:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  101846:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  10184a:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10184e:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101852:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101853:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10185a:	66 83 f8 ff          	cmp    $0xffff,%ax
  10185e:	74 12                	je     101872 <pic_init+0x139>
        pic_setmask(irq_mask);
  101860:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101867:	0f b7 c0             	movzwl %ax,%eax
  10186a:	89 04 24             	mov    %eax,(%esp)
  10186d:	e8 3a fe ff ff       	call   1016ac <pic_setmask>
    }
}
  101872:	c9                   	leave  
  101873:	c3                   	ret    

00101874 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101874:	55                   	push   %ebp
  101875:	89 e5                	mov    %esp,%ebp
  101877:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10187a:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101881:	00 
  101882:	c7 04 24 80 39 10 00 	movl   $0x103980,(%esp)
  101889:	e8 8d ea ff ff       	call   10031b <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10188e:	c9                   	leave  
  10188f:	c3                   	ret    

00101890 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101890:	55                   	push   %ebp
  101891:	89 e5                	mov    %esp,%ebp
  101893:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101896:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10189d:	e9 c3 00 00 00       	jmp    101965 <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  1018a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018a5:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018ac:	89 c2                	mov    %eax,%edx
  1018ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b1:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  1018b8:	00 
  1018b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018bc:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  1018c3:	00 08 00 
  1018c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c9:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018d0:	00 
  1018d1:	83 e2 e0             	and    $0xffffffe0,%edx
  1018d4:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1018db:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018de:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  1018e5:	00 
  1018e6:	83 e2 1f             	and    $0x1f,%edx
  1018e9:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  1018f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018f3:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018fa:	00 
  1018fb:	83 e2 f0             	and    $0xfffffff0,%edx
  1018fe:	83 ca 0e             	or     $0xe,%edx
  101901:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101908:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10190b:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101912:	00 
  101913:	83 e2 ef             	and    $0xffffffef,%edx
  101916:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10191d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101920:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101927:	00 
  101928:	83 e2 9f             	and    $0xffffff9f,%edx
  10192b:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101932:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101935:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10193c:	00 
  10193d:	83 ca 80             	or     $0xffffff80,%edx
  101940:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101947:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10194a:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101951:	c1 e8 10             	shr    $0x10,%eax
  101954:	89 c2                	mov    %eax,%edx
  101956:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101959:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101960:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  101961:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101965:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101968:	3d ff 00 00 00       	cmp    $0xff,%eax
  10196d:	0f 86 2f ff ff ff    	jbe    1018a2 <idt_init+0x12>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101973:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101978:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  10197e:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101985:	08 00 
  101987:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10198e:	83 e0 e0             	and    $0xffffffe0,%eax
  101991:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101996:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  10199d:	83 e0 1f             	and    $0x1f,%eax
  1019a0:	a2 6c f4 10 00       	mov    %al,0x10f46c
  1019a5:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019ac:	83 e0 f0             	and    $0xfffffff0,%eax
  1019af:	83 c8 0e             	or     $0xe,%eax
  1019b2:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019b7:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019be:	83 e0 ef             	and    $0xffffffef,%eax
  1019c1:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019c6:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019cd:	83 c8 60             	or     $0x60,%eax
  1019d0:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019d5:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  1019dc:	83 c8 80             	or     $0xffffff80,%eax
  1019df:	a2 6d f4 10 00       	mov    %al,0x10f46d
  1019e4:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1019e9:	c1 e8 10             	shr    $0x10,%eax
  1019ec:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  1019f2:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1019f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1019fc:	0f 01 18             	lidtl  (%eax)
	// load the IDT
    lidt(&idt_pd);
}
  1019ff:	c9                   	leave  
  101a00:	c3                   	ret    

00101a01 <trapname>:

static const char *
trapname(int trapno) {
  101a01:	55                   	push   %ebp
  101a02:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101a04:	8b 45 08             	mov    0x8(%ebp),%eax
  101a07:	83 f8 13             	cmp    $0x13,%eax
  101a0a:	77 0c                	ja     101a18 <trapname+0x17>
        return excnames[trapno];
  101a0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0f:	8b 04 85 e0 3c 10 00 	mov    0x103ce0(,%eax,4),%eax
  101a16:	eb 18                	jmp    101a30 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101a18:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101a1c:	7e 0d                	jle    101a2b <trapname+0x2a>
  101a1e:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101a22:	7f 07                	jg     101a2b <trapname+0x2a>
        return "Hardware Interrupt";
  101a24:	b8 8a 39 10 00       	mov    $0x10398a,%eax
  101a29:	eb 05                	jmp    101a30 <trapname+0x2f>
    }
    return "(unknown trap)";
  101a2b:	b8 9d 39 10 00       	mov    $0x10399d,%eax
}
  101a30:	5d                   	pop    %ebp
  101a31:	c3                   	ret    

00101a32 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101a32:	55                   	push   %ebp
  101a33:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101a35:	8b 45 08             	mov    0x8(%ebp),%eax
  101a38:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a3c:	66 83 f8 08          	cmp    $0x8,%ax
  101a40:	0f 94 c0             	sete   %al
  101a43:	0f b6 c0             	movzbl %al,%eax
}
  101a46:	5d                   	pop    %ebp
  101a47:	c3                   	ret    

00101a48 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101a48:	55                   	push   %ebp
  101a49:	89 e5                	mov    %esp,%ebp
  101a4b:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101a4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a51:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a55:	c7 04 24 de 39 10 00 	movl   $0x1039de,(%esp)
  101a5c:	e8 ba e8 ff ff       	call   10031b <cprintf>
    print_regs(&tf->tf_regs);
  101a61:	8b 45 08             	mov    0x8(%ebp),%eax
  101a64:	89 04 24             	mov    %eax,(%esp)
  101a67:	e8 a1 01 00 00       	call   101c0d <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a6c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a73:	0f b7 c0             	movzwl %ax,%eax
  101a76:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a7a:	c7 04 24 ef 39 10 00 	movl   $0x1039ef,(%esp)
  101a81:	e8 95 e8 ff ff       	call   10031b <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a86:	8b 45 08             	mov    0x8(%ebp),%eax
  101a89:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a8d:	0f b7 c0             	movzwl %ax,%eax
  101a90:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a94:	c7 04 24 02 3a 10 00 	movl   $0x103a02,(%esp)
  101a9b:	e8 7b e8 ff ff       	call   10031b <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101aa0:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa3:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101aa7:	0f b7 c0             	movzwl %ax,%eax
  101aaa:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aae:	c7 04 24 15 3a 10 00 	movl   $0x103a15,(%esp)
  101ab5:	e8 61 e8 ff ff       	call   10031b <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101aba:	8b 45 08             	mov    0x8(%ebp),%eax
  101abd:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101ac1:	0f b7 c0             	movzwl %ax,%eax
  101ac4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac8:	c7 04 24 28 3a 10 00 	movl   $0x103a28,(%esp)
  101acf:	e8 47 e8 ff ff       	call   10031b <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101ad4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad7:	8b 40 30             	mov    0x30(%eax),%eax
  101ada:	89 04 24             	mov    %eax,(%esp)
  101add:	e8 1f ff ff ff       	call   101a01 <trapname>
  101ae2:	8b 55 08             	mov    0x8(%ebp),%edx
  101ae5:	8b 52 30             	mov    0x30(%edx),%edx
  101ae8:	89 44 24 08          	mov    %eax,0x8(%esp)
  101aec:	89 54 24 04          	mov    %edx,0x4(%esp)
  101af0:	c7 04 24 3b 3a 10 00 	movl   $0x103a3b,(%esp)
  101af7:	e8 1f e8 ff ff       	call   10031b <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101afc:	8b 45 08             	mov    0x8(%ebp),%eax
  101aff:	8b 40 34             	mov    0x34(%eax),%eax
  101b02:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b06:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101b0d:	e8 09 e8 ff ff       	call   10031b <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101b12:	8b 45 08             	mov    0x8(%ebp),%eax
  101b15:	8b 40 38             	mov    0x38(%eax),%eax
  101b18:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1c:	c7 04 24 5c 3a 10 00 	movl   $0x103a5c,(%esp)
  101b23:	e8 f3 e7 ff ff       	call   10031b <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101b28:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b2f:	0f b7 c0             	movzwl %ax,%eax
  101b32:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b36:	c7 04 24 6b 3a 10 00 	movl   $0x103a6b,(%esp)
  101b3d:	e8 d9 e7 ff ff       	call   10031b <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101b42:	8b 45 08             	mov    0x8(%ebp),%eax
  101b45:	8b 40 40             	mov    0x40(%eax),%eax
  101b48:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4c:	c7 04 24 7e 3a 10 00 	movl   $0x103a7e,(%esp)
  101b53:	e8 c3 e7 ff ff       	call   10031b <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b58:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101b5f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101b66:	eb 3e                	jmp    101ba6 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101b68:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6b:	8b 50 40             	mov    0x40(%eax),%edx
  101b6e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b71:	21 d0                	and    %edx,%eax
  101b73:	85 c0                	test   %eax,%eax
  101b75:	74 28                	je     101b9f <print_trapframe+0x157>
  101b77:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b7a:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b81:	85 c0                	test   %eax,%eax
  101b83:	74 1a                	je     101b9f <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b88:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b8f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b93:	c7 04 24 8d 3a 10 00 	movl   $0x103a8d,(%esp)
  101b9a:	e8 7c e7 ff ff       	call   10031b <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b9f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101ba3:	d1 65 f0             	shll   -0x10(%ebp)
  101ba6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ba9:	83 f8 17             	cmp    $0x17,%eax
  101bac:	76 ba                	jbe    101b68 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101bae:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb1:	8b 40 40             	mov    0x40(%eax),%eax
  101bb4:	25 00 30 00 00       	and    $0x3000,%eax
  101bb9:	c1 e8 0c             	shr    $0xc,%eax
  101bbc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc0:	c7 04 24 91 3a 10 00 	movl   $0x103a91,(%esp)
  101bc7:	e8 4f e7 ff ff       	call   10031b <cprintf>

    if (!trap_in_kernel(tf)) {
  101bcc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcf:	89 04 24             	mov    %eax,(%esp)
  101bd2:	e8 5b fe ff ff       	call   101a32 <trap_in_kernel>
  101bd7:	85 c0                	test   %eax,%eax
  101bd9:	75 30                	jne    101c0b <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101bdb:	8b 45 08             	mov    0x8(%ebp),%eax
  101bde:	8b 40 44             	mov    0x44(%eax),%eax
  101be1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be5:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101bec:	e8 2a e7 ff ff       	call   10031b <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101bf1:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf4:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101bf8:	0f b7 c0             	movzwl %ax,%eax
  101bfb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bff:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101c06:	e8 10 e7 ff ff       	call   10031b <cprintf>
    }
}
  101c0b:	c9                   	leave  
  101c0c:	c3                   	ret    

00101c0d <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c0d:	55                   	push   %ebp
  101c0e:	89 e5                	mov    %esp,%ebp
  101c10:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101c13:	8b 45 08             	mov    0x8(%ebp),%eax
  101c16:	8b 00                	mov    (%eax),%eax
  101c18:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1c:	c7 04 24 bc 3a 10 00 	movl   $0x103abc,(%esp)
  101c23:	e8 f3 e6 ff ff       	call   10031b <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101c28:	8b 45 08             	mov    0x8(%ebp),%eax
  101c2b:	8b 40 04             	mov    0x4(%eax),%eax
  101c2e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c32:	c7 04 24 cb 3a 10 00 	movl   $0x103acb,(%esp)
  101c39:	e8 dd e6 ff ff       	call   10031b <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101c3e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c41:	8b 40 08             	mov    0x8(%eax),%eax
  101c44:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c48:	c7 04 24 da 3a 10 00 	movl   $0x103ada,(%esp)
  101c4f:	e8 c7 e6 ff ff       	call   10031b <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101c54:	8b 45 08             	mov    0x8(%ebp),%eax
  101c57:	8b 40 0c             	mov    0xc(%eax),%eax
  101c5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c5e:	c7 04 24 e9 3a 10 00 	movl   $0x103ae9,(%esp)
  101c65:	e8 b1 e6 ff ff       	call   10031b <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101c6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101c6d:	8b 40 10             	mov    0x10(%eax),%eax
  101c70:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c74:	c7 04 24 f8 3a 10 00 	movl   $0x103af8,(%esp)
  101c7b:	e8 9b e6 ff ff       	call   10031b <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c80:	8b 45 08             	mov    0x8(%ebp),%eax
  101c83:	8b 40 14             	mov    0x14(%eax),%eax
  101c86:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c8a:	c7 04 24 07 3b 10 00 	movl   $0x103b07,(%esp)
  101c91:	e8 85 e6 ff ff       	call   10031b <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c96:	8b 45 08             	mov    0x8(%ebp),%eax
  101c99:	8b 40 18             	mov    0x18(%eax),%eax
  101c9c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ca0:	c7 04 24 16 3b 10 00 	movl   $0x103b16,(%esp)
  101ca7:	e8 6f e6 ff ff       	call   10031b <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101cac:	8b 45 08             	mov    0x8(%ebp),%eax
  101caf:	8b 40 1c             	mov    0x1c(%eax),%eax
  101cb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb6:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101cbd:	e8 59 e6 ff ff       	call   10031b <cprintf>
}
  101cc2:	c9                   	leave  
  101cc3:	c3                   	ret    

00101cc4 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
struct trapframe switchk2u, *switchu2k;

static void
trap_dispatch(struct trapframe *tf) {
  101cc4:	55                   	push   %ebp
  101cc5:	89 e5                	mov    %esp,%ebp
  101cc7:	57                   	push   %edi
  101cc8:	56                   	push   %esi
  101cc9:	53                   	push   %ebx
  101cca:	83 ec 2c             	sub    $0x2c,%esp
    char c;

    switch (tf->tf_trapno) {
  101ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd0:	8b 40 30             	mov    0x30(%eax),%eax
  101cd3:	83 f8 2f             	cmp    $0x2f,%eax
  101cd6:	77 21                	ja     101cf9 <trap_dispatch+0x35>
  101cd8:	83 f8 2e             	cmp    $0x2e,%eax
  101cdb:	0f 83 8c 01 00 00    	jae    101e6d <trap_dispatch+0x1a9>
  101ce1:	83 f8 21             	cmp    $0x21,%eax
  101ce4:	0f 84 8b 00 00 00    	je     101d75 <trap_dispatch+0xb1>
  101cea:	83 f8 24             	cmp    $0x24,%eax
  101ced:	74 5d                	je     101d4c <trap_dispatch+0x88>
  101cef:	83 f8 20             	cmp    $0x20,%eax
  101cf2:	74 1c                	je     101d10 <trap_dispatch+0x4c>
  101cf4:	e9 3c 01 00 00       	jmp    101e35 <trap_dispatch+0x171>
  101cf9:	83 f8 78             	cmp    $0x78,%eax
  101cfc:	0f 84 9c 00 00 00    	je     101d9e <trap_dispatch+0xda>
  101d02:	83 f8 79             	cmp    $0x79,%eax
  101d05:	0f 84 0e 01 00 00    	je     101e19 <trap_dispatch+0x155>
  101d0b:	e9 25 01 00 00       	jmp    101e35 <trap_dispatch+0x171>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101d10:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101d15:	83 c0 01             	add    $0x1,%eax
  101d18:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks % TICK_NUM == 0) {
  101d1d:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101d23:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101d28:	89 c8                	mov    %ecx,%eax
  101d2a:	f7 e2                	mul    %edx
  101d2c:	89 d0                	mov    %edx,%eax
  101d2e:	c1 e8 05             	shr    $0x5,%eax
  101d31:	6b c0 64             	imul   $0x64,%eax,%eax
  101d34:	89 ca                	mov    %ecx,%edx
  101d36:	29 c2                	sub    %eax,%edx
  101d38:	89 d0                	mov    %edx,%eax
  101d3a:	85 c0                	test   %eax,%eax
  101d3c:	0f 85 2e 01 00 00    	jne    101e70 <trap_dispatch+0x1ac>
            print_ticks();
  101d42:	e8 2d fb ff ff       	call   101874 <print_ticks>
        }
        break;
  101d47:	e9 24 01 00 00       	jmp    101e70 <trap_dispatch+0x1ac>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101d4c:	e8 f2 f8 ff ff       	call   101643 <cons_getc>
  101d51:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101d54:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d58:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d5c:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d60:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d64:	c7 04 24 34 3b 10 00 	movl   $0x103b34,(%esp)
  101d6b:	e8 ab e5 ff ff       	call   10031b <cprintf>
        break;
  101d70:	e9 ff 00 00 00       	jmp    101e74 <trap_dispatch+0x1b0>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d75:	e8 c9 f8 ff ff       	call   101643 <cons_getc>
  101d7a:	88 45 e7             	mov    %al,-0x19(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d7d:	0f be 55 e7          	movsbl -0x19(%ebp),%edx
  101d81:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
  101d85:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d89:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d8d:	c7 04 24 46 3b 10 00 	movl   $0x103b46,(%esp)
  101d94:	e8 82 e5 ff ff       	call   10031b <cprintf>
        break;
  101d99:	e9 d6 00 00 00       	jmp    101e74 <trap_dispatch+0x1b0>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
	if (tf->tf_cs != USER_CS) {
  101d9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101da1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101da5:	66 83 f8 1b          	cmp    $0x1b,%ax
  101da9:	0f 84 c4 00 00 00    	je     101e73 <trap_dispatch+0x1af>
            switchk2u = *tf;
  101daf:	8b 45 08             	mov    0x8(%ebp),%eax
  101db2:	ba 20 f9 10 00       	mov    $0x10f920,%edx
  101db7:	89 c3                	mov    %eax,%ebx
  101db9:	b8 13 00 00 00       	mov    $0x13,%eax
  101dbe:	89 d7                	mov    %edx,%edi
  101dc0:	89 de                	mov    %ebx,%esi
  101dc2:	89 c1                	mov    %eax,%ecx
  101dc4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
            switchk2u.tf_cs = USER_CS;
  101dc6:	66 c7 05 5c f9 10 00 	movw   $0x1b,0x10f95c
  101dcd:	1b 00 
            switchk2u.tf_ds = switchk2u.tf_es = switchk2u.tf_ss = USER_DS;
  101dcf:	66 c7 05 68 f9 10 00 	movw   $0x23,0x10f968
  101dd6:	23 00 
  101dd8:	0f b7 05 68 f9 10 00 	movzwl 0x10f968,%eax
  101ddf:	66 a3 48 f9 10 00    	mov    %ax,0x10f948
  101de5:	0f b7 05 48 f9 10 00 	movzwl 0x10f948,%eax
  101dec:	66 a3 4c f9 10 00    	mov    %ax,0x10f94c
            switchk2u.tf_esp = (uint32_t)tf + sizeof(struct trapframe) - 8;
  101df2:	8b 45 08             	mov    0x8(%ebp),%eax
  101df5:	83 c0 44             	add    $0x44,%eax
  101df8:	a3 64 f9 10 00       	mov    %eax,0x10f964
		
            // set eflags, make sure ucore can use io under user mode.
            // if CPL > IOPL, then cpu will generate a general protection.
            switchk2u.tf_eflags |= FL_IOPL_MASK;
  101dfd:	a1 60 f9 10 00       	mov    0x10f960,%eax
  101e02:	80 cc 30             	or     $0x30,%ah
  101e05:	a3 60 f9 10 00       	mov    %eax,0x10f960
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
  101e0a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e0d:	8d 50 fc             	lea    -0x4(%eax),%edx
  101e10:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  101e15:	89 02                	mov    %eax,(%edx)
        }
        break;
  101e17:	eb 5a                	jmp    101e73 <trap_dispatch+0x1af>
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e19:	c7 44 24 08 55 3b 10 	movl   $0x103b55,0x8(%esp)
  101e20:	00 
  101e21:	c7 44 24 04 c0 00 00 	movl   $0xc0,0x4(%esp)
  101e28:	00 
  101e29:	c7 04 24 65 3b 10 00 	movl   $0x103b65,(%esp)
  101e30:	e8 47 ee ff ff       	call   100c7c <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e35:	8b 45 08             	mov    0x8(%ebp),%eax
  101e38:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e3c:	0f b7 c0             	movzwl %ax,%eax
  101e3f:	83 e0 03             	and    $0x3,%eax
  101e42:	85 c0                	test   %eax,%eax
  101e44:	75 2e                	jne    101e74 <trap_dispatch+0x1b0>
            print_trapframe(tf);
  101e46:	8b 45 08             	mov    0x8(%ebp),%eax
  101e49:	89 04 24             	mov    %eax,(%esp)
  101e4c:	e8 f7 fb ff ff       	call   101a48 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e51:	c7 44 24 08 76 3b 10 	movl   $0x103b76,0x8(%esp)
  101e58:	00 
  101e59:	c7 44 24 04 ca 00 00 	movl   $0xca,0x4(%esp)
  101e60:	00 
  101e61:	c7 04 24 65 3b 10 00 	movl   $0x103b65,(%esp)
  101e68:	e8 0f ee ff ff       	call   100c7c <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101e6d:	90                   	nop
  101e6e:	eb 04                	jmp    101e74 <trap_dispatch+0x1b0>
         */
        ticks ++;
        if (ticks % TICK_NUM == 0) {
            print_ticks();
        }
        break;
  101e70:	90                   	nop
  101e71:	eb 01                	jmp    101e74 <trap_dispatch+0x1b0>
		
            // set temporary stack
            // then iret will jump to the right stack
            *((uint32_t *)tf - 1) = (uint32_t)&switchk2u;
        }
        break;
  101e73:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101e74:	83 c4 2c             	add    $0x2c,%esp
  101e77:	5b                   	pop    %ebx
  101e78:	5e                   	pop    %esi
  101e79:	5f                   	pop    %edi
  101e7a:	5d                   	pop    %ebp
  101e7b:	c3                   	ret    

00101e7c <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e7c:	55                   	push   %ebp
  101e7d:	89 e5                	mov    %esp,%ebp
  101e7f:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e82:	8b 45 08             	mov    0x8(%ebp),%eax
  101e85:	89 04 24             	mov    %eax,(%esp)
  101e88:	e8 37 fe ff ff       	call   101cc4 <trap_dispatch>
}
  101e8d:	c9                   	leave  
  101e8e:	c3                   	ret    
	...

00101e90 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101e90:	1e                   	push   %ds
    pushl %es
  101e91:	06                   	push   %es
    pushl %fs
  101e92:	0f a0                	push   %fs
    pushl %gs
  101e94:	0f a8                	push   %gs
    pushal
  101e96:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101e97:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101e9c:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101e9e:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101ea0:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101ea1:	e8 d6 ff ff ff       	call   101e7c <trap>

    # pop the pushed stack pointer
    popl %esp
  101ea6:	5c                   	pop    %esp

00101ea7 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101ea7:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101ea8:	0f a9                	pop    %gs
    popl %fs
  101eaa:	0f a1                	pop    %fs
    popl %es
  101eac:	07                   	pop    %es
    popl %ds
  101ead:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101eae:	83 c4 08             	add    $0x8,%esp
    iret
  101eb1:	cf                   	iret   
	...

00101eb4 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101eb4:	6a 00                	push   $0x0
  pushl $0
  101eb6:	6a 00                	push   $0x0
  jmp __alltraps
  101eb8:	e9 d3 ff ff ff       	jmp    101e90 <__alltraps>

00101ebd <vector1>:
.globl vector1
vector1:
  pushl $0
  101ebd:	6a 00                	push   $0x0
  pushl $1
  101ebf:	6a 01                	push   $0x1
  jmp __alltraps
  101ec1:	e9 ca ff ff ff       	jmp    101e90 <__alltraps>

00101ec6 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ec6:	6a 00                	push   $0x0
  pushl $2
  101ec8:	6a 02                	push   $0x2
  jmp __alltraps
  101eca:	e9 c1 ff ff ff       	jmp    101e90 <__alltraps>

00101ecf <vector3>:
.globl vector3
vector3:
  pushl $0
  101ecf:	6a 00                	push   $0x0
  pushl $3
  101ed1:	6a 03                	push   $0x3
  jmp __alltraps
  101ed3:	e9 b8 ff ff ff       	jmp    101e90 <__alltraps>

00101ed8 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ed8:	6a 00                	push   $0x0
  pushl $4
  101eda:	6a 04                	push   $0x4
  jmp __alltraps
  101edc:	e9 af ff ff ff       	jmp    101e90 <__alltraps>

00101ee1 <vector5>:
.globl vector5
vector5:
  pushl $0
  101ee1:	6a 00                	push   $0x0
  pushl $5
  101ee3:	6a 05                	push   $0x5
  jmp __alltraps
  101ee5:	e9 a6 ff ff ff       	jmp    101e90 <__alltraps>

00101eea <vector6>:
.globl vector6
vector6:
  pushl $0
  101eea:	6a 00                	push   $0x0
  pushl $6
  101eec:	6a 06                	push   $0x6
  jmp __alltraps
  101eee:	e9 9d ff ff ff       	jmp    101e90 <__alltraps>

00101ef3 <vector7>:
.globl vector7
vector7:
  pushl $0
  101ef3:	6a 00                	push   $0x0
  pushl $7
  101ef5:	6a 07                	push   $0x7
  jmp __alltraps
  101ef7:	e9 94 ff ff ff       	jmp    101e90 <__alltraps>

00101efc <vector8>:
.globl vector8
vector8:
  pushl $8
  101efc:	6a 08                	push   $0x8
  jmp __alltraps
  101efe:	e9 8d ff ff ff       	jmp    101e90 <__alltraps>

00101f03 <vector9>:
.globl vector9
vector9:
  pushl $9
  101f03:	6a 09                	push   $0x9
  jmp __alltraps
  101f05:	e9 86 ff ff ff       	jmp    101e90 <__alltraps>

00101f0a <vector10>:
.globl vector10
vector10:
  pushl $10
  101f0a:	6a 0a                	push   $0xa
  jmp __alltraps
  101f0c:	e9 7f ff ff ff       	jmp    101e90 <__alltraps>

00101f11 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f11:	6a 0b                	push   $0xb
  jmp __alltraps
  101f13:	e9 78 ff ff ff       	jmp    101e90 <__alltraps>

00101f18 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f18:	6a 0c                	push   $0xc
  jmp __alltraps
  101f1a:	e9 71 ff ff ff       	jmp    101e90 <__alltraps>

00101f1f <vector13>:
.globl vector13
vector13:
  pushl $13
  101f1f:	6a 0d                	push   $0xd
  jmp __alltraps
  101f21:	e9 6a ff ff ff       	jmp    101e90 <__alltraps>

00101f26 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f26:	6a 0e                	push   $0xe
  jmp __alltraps
  101f28:	e9 63 ff ff ff       	jmp    101e90 <__alltraps>

00101f2d <vector15>:
.globl vector15
vector15:
  pushl $0
  101f2d:	6a 00                	push   $0x0
  pushl $15
  101f2f:	6a 0f                	push   $0xf
  jmp __alltraps
  101f31:	e9 5a ff ff ff       	jmp    101e90 <__alltraps>

00101f36 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f36:	6a 00                	push   $0x0
  pushl $16
  101f38:	6a 10                	push   $0x10
  jmp __alltraps
  101f3a:	e9 51 ff ff ff       	jmp    101e90 <__alltraps>

00101f3f <vector17>:
.globl vector17
vector17:
  pushl $17
  101f3f:	6a 11                	push   $0x11
  jmp __alltraps
  101f41:	e9 4a ff ff ff       	jmp    101e90 <__alltraps>

00101f46 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f46:	6a 00                	push   $0x0
  pushl $18
  101f48:	6a 12                	push   $0x12
  jmp __alltraps
  101f4a:	e9 41 ff ff ff       	jmp    101e90 <__alltraps>

00101f4f <vector19>:
.globl vector19
vector19:
  pushl $0
  101f4f:	6a 00                	push   $0x0
  pushl $19
  101f51:	6a 13                	push   $0x13
  jmp __alltraps
  101f53:	e9 38 ff ff ff       	jmp    101e90 <__alltraps>

00101f58 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f58:	6a 00                	push   $0x0
  pushl $20
  101f5a:	6a 14                	push   $0x14
  jmp __alltraps
  101f5c:	e9 2f ff ff ff       	jmp    101e90 <__alltraps>

00101f61 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f61:	6a 00                	push   $0x0
  pushl $21
  101f63:	6a 15                	push   $0x15
  jmp __alltraps
  101f65:	e9 26 ff ff ff       	jmp    101e90 <__alltraps>

00101f6a <vector22>:
.globl vector22
vector22:
  pushl $0
  101f6a:	6a 00                	push   $0x0
  pushl $22
  101f6c:	6a 16                	push   $0x16
  jmp __alltraps
  101f6e:	e9 1d ff ff ff       	jmp    101e90 <__alltraps>

00101f73 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f73:	6a 00                	push   $0x0
  pushl $23
  101f75:	6a 17                	push   $0x17
  jmp __alltraps
  101f77:	e9 14 ff ff ff       	jmp    101e90 <__alltraps>

00101f7c <vector24>:
.globl vector24
vector24:
  pushl $0
  101f7c:	6a 00                	push   $0x0
  pushl $24
  101f7e:	6a 18                	push   $0x18
  jmp __alltraps
  101f80:	e9 0b ff ff ff       	jmp    101e90 <__alltraps>

00101f85 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f85:	6a 00                	push   $0x0
  pushl $25
  101f87:	6a 19                	push   $0x19
  jmp __alltraps
  101f89:	e9 02 ff ff ff       	jmp    101e90 <__alltraps>

00101f8e <vector26>:
.globl vector26
vector26:
  pushl $0
  101f8e:	6a 00                	push   $0x0
  pushl $26
  101f90:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f92:	e9 f9 fe ff ff       	jmp    101e90 <__alltraps>

00101f97 <vector27>:
.globl vector27
vector27:
  pushl $0
  101f97:	6a 00                	push   $0x0
  pushl $27
  101f99:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f9b:	e9 f0 fe ff ff       	jmp    101e90 <__alltraps>

00101fa0 <vector28>:
.globl vector28
vector28:
  pushl $0
  101fa0:	6a 00                	push   $0x0
  pushl $28
  101fa2:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fa4:	e9 e7 fe ff ff       	jmp    101e90 <__alltraps>

00101fa9 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fa9:	6a 00                	push   $0x0
  pushl $29
  101fab:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fad:	e9 de fe ff ff       	jmp    101e90 <__alltraps>

00101fb2 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fb2:	6a 00                	push   $0x0
  pushl $30
  101fb4:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fb6:	e9 d5 fe ff ff       	jmp    101e90 <__alltraps>

00101fbb <vector31>:
.globl vector31
vector31:
  pushl $0
  101fbb:	6a 00                	push   $0x0
  pushl $31
  101fbd:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fbf:	e9 cc fe ff ff       	jmp    101e90 <__alltraps>

00101fc4 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fc4:	6a 00                	push   $0x0
  pushl $32
  101fc6:	6a 20                	push   $0x20
  jmp __alltraps
  101fc8:	e9 c3 fe ff ff       	jmp    101e90 <__alltraps>

00101fcd <vector33>:
.globl vector33
vector33:
  pushl $0
  101fcd:	6a 00                	push   $0x0
  pushl $33
  101fcf:	6a 21                	push   $0x21
  jmp __alltraps
  101fd1:	e9 ba fe ff ff       	jmp    101e90 <__alltraps>

00101fd6 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fd6:	6a 00                	push   $0x0
  pushl $34
  101fd8:	6a 22                	push   $0x22
  jmp __alltraps
  101fda:	e9 b1 fe ff ff       	jmp    101e90 <__alltraps>

00101fdf <vector35>:
.globl vector35
vector35:
  pushl $0
  101fdf:	6a 00                	push   $0x0
  pushl $35
  101fe1:	6a 23                	push   $0x23
  jmp __alltraps
  101fe3:	e9 a8 fe ff ff       	jmp    101e90 <__alltraps>

00101fe8 <vector36>:
.globl vector36
vector36:
  pushl $0
  101fe8:	6a 00                	push   $0x0
  pushl $36
  101fea:	6a 24                	push   $0x24
  jmp __alltraps
  101fec:	e9 9f fe ff ff       	jmp    101e90 <__alltraps>

00101ff1 <vector37>:
.globl vector37
vector37:
  pushl $0
  101ff1:	6a 00                	push   $0x0
  pushl $37
  101ff3:	6a 25                	push   $0x25
  jmp __alltraps
  101ff5:	e9 96 fe ff ff       	jmp    101e90 <__alltraps>

00101ffa <vector38>:
.globl vector38
vector38:
  pushl $0
  101ffa:	6a 00                	push   $0x0
  pushl $38
  101ffc:	6a 26                	push   $0x26
  jmp __alltraps
  101ffe:	e9 8d fe ff ff       	jmp    101e90 <__alltraps>

00102003 <vector39>:
.globl vector39
vector39:
  pushl $0
  102003:	6a 00                	push   $0x0
  pushl $39
  102005:	6a 27                	push   $0x27
  jmp __alltraps
  102007:	e9 84 fe ff ff       	jmp    101e90 <__alltraps>

0010200c <vector40>:
.globl vector40
vector40:
  pushl $0
  10200c:	6a 00                	push   $0x0
  pushl $40
  10200e:	6a 28                	push   $0x28
  jmp __alltraps
  102010:	e9 7b fe ff ff       	jmp    101e90 <__alltraps>

00102015 <vector41>:
.globl vector41
vector41:
  pushl $0
  102015:	6a 00                	push   $0x0
  pushl $41
  102017:	6a 29                	push   $0x29
  jmp __alltraps
  102019:	e9 72 fe ff ff       	jmp    101e90 <__alltraps>

0010201e <vector42>:
.globl vector42
vector42:
  pushl $0
  10201e:	6a 00                	push   $0x0
  pushl $42
  102020:	6a 2a                	push   $0x2a
  jmp __alltraps
  102022:	e9 69 fe ff ff       	jmp    101e90 <__alltraps>

00102027 <vector43>:
.globl vector43
vector43:
  pushl $0
  102027:	6a 00                	push   $0x0
  pushl $43
  102029:	6a 2b                	push   $0x2b
  jmp __alltraps
  10202b:	e9 60 fe ff ff       	jmp    101e90 <__alltraps>

00102030 <vector44>:
.globl vector44
vector44:
  pushl $0
  102030:	6a 00                	push   $0x0
  pushl $44
  102032:	6a 2c                	push   $0x2c
  jmp __alltraps
  102034:	e9 57 fe ff ff       	jmp    101e90 <__alltraps>

00102039 <vector45>:
.globl vector45
vector45:
  pushl $0
  102039:	6a 00                	push   $0x0
  pushl $45
  10203b:	6a 2d                	push   $0x2d
  jmp __alltraps
  10203d:	e9 4e fe ff ff       	jmp    101e90 <__alltraps>

00102042 <vector46>:
.globl vector46
vector46:
  pushl $0
  102042:	6a 00                	push   $0x0
  pushl $46
  102044:	6a 2e                	push   $0x2e
  jmp __alltraps
  102046:	e9 45 fe ff ff       	jmp    101e90 <__alltraps>

0010204b <vector47>:
.globl vector47
vector47:
  pushl $0
  10204b:	6a 00                	push   $0x0
  pushl $47
  10204d:	6a 2f                	push   $0x2f
  jmp __alltraps
  10204f:	e9 3c fe ff ff       	jmp    101e90 <__alltraps>

00102054 <vector48>:
.globl vector48
vector48:
  pushl $0
  102054:	6a 00                	push   $0x0
  pushl $48
  102056:	6a 30                	push   $0x30
  jmp __alltraps
  102058:	e9 33 fe ff ff       	jmp    101e90 <__alltraps>

0010205d <vector49>:
.globl vector49
vector49:
  pushl $0
  10205d:	6a 00                	push   $0x0
  pushl $49
  10205f:	6a 31                	push   $0x31
  jmp __alltraps
  102061:	e9 2a fe ff ff       	jmp    101e90 <__alltraps>

00102066 <vector50>:
.globl vector50
vector50:
  pushl $0
  102066:	6a 00                	push   $0x0
  pushl $50
  102068:	6a 32                	push   $0x32
  jmp __alltraps
  10206a:	e9 21 fe ff ff       	jmp    101e90 <__alltraps>

0010206f <vector51>:
.globl vector51
vector51:
  pushl $0
  10206f:	6a 00                	push   $0x0
  pushl $51
  102071:	6a 33                	push   $0x33
  jmp __alltraps
  102073:	e9 18 fe ff ff       	jmp    101e90 <__alltraps>

00102078 <vector52>:
.globl vector52
vector52:
  pushl $0
  102078:	6a 00                	push   $0x0
  pushl $52
  10207a:	6a 34                	push   $0x34
  jmp __alltraps
  10207c:	e9 0f fe ff ff       	jmp    101e90 <__alltraps>

00102081 <vector53>:
.globl vector53
vector53:
  pushl $0
  102081:	6a 00                	push   $0x0
  pushl $53
  102083:	6a 35                	push   $0x35
  jmp __alltraps
  102085:	e9 06 fe ff ff       	jmp    101e90 <__alltraps>

0010208a <vector54>:
.globl vector54
vector54:
  pushl $0
  10208a:	6a 00                	push   $0x0
  pushl $54
  10208c:	6a 36                	push   $0x36
  jmp __alltraps
  10208e:	e9 fd fd ff ff       	jmp    101e90 <__alltraps>

00102093 <vector55>:
.globl vector55
vector55:
  pushl $0
  102093:	6a 00                	push   $0x0
  pushl $55
  102095:	6a 37                	push   $0x37
  jmp __alltraps
  102097:	e9 f4 fd ff ff       	jmp    101e90 <__alltraps>

0010209c <vector56>:
.globl vector56
vector56:
  pushl $0
  10209c:	6a 00                	push   $0x0
  pushl $56
  10209e:	6a 38                	push   $0x38
  jmp __alltraps
  1020a0:	e9 eb fd ff ff       	jmp    101e90 <__alltraps>

001020a5 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020a5:	6a 00                	push   $0x0
  pushl $57
  1020a7:	6a 39                	push   $0x39
  jmp __alltraps
  1020a9:	e9 e2 fd ff ff       	jmp    101e90 <__alltraps>

001020ae <vector58>:
.globl vector58
vector58:
  pushl $0
  1020ae:	6a 00                	push   $0x0
  pushl $58
  1020b0:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020b2:	e9 d9 fd ff ff       	jmp    101e90 <__alltraps>

001020b7 <vector59>:
.globl vector59
vector59:
  pushl $0
  1020b7:	6a 00                	push   $0x0
  pushl $59
  1020b9:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020bb:	e9 d0 fd ff ff       	jmp    101e90 <__alltraps>

001020c0 <vector60>:
.globl vector60
vector60:
  pushl $0
  1020c0:	6a 00                	push   $0x0
  pushl $60
  1020c2:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020c4:	e9 c7 fd ff ff       	jmp    101e90 <__alltraps>

001020c9 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020c9:	6a 00                	push   $0x0
  pushl $61
  1020cb:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020cd:	e9 be fd ff ff       	jmp    101e90 <__alltraps>

001020d2 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020d2:	6a 00                	push   $0x0
  pushl $62
  1020d4:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020d6:	e9 b5 fd ff ff       	jmp    101e90 <__alltraps>

001020db <vector63>:
.globl vector63
vector63:
  pushl $0
  1020db:	6a 00                	push   $0x0
  pushl $63
  1020dd:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020df:	e9 ac fd ff ff       	jmp    101e90 <__alltraps>

001020e4 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020e4:	6a 00                	push   $0x0
  pushl $64
  1020e6:	6a 40                	push   $0x40
  jmp __alltraps
  1020e8:	e9 a3 fd ff ff       	jmp    101e90 <__alltraps>

001020ed <vector65>:
.globl vector65
vector65:
  pushl $0
  1020ed:	6a 00                	push   $0x0
  pushl $65
  1020ef:	6a 41                	push   $0x41
  jmp __alltraps
  1020f1:	e9 9a fd ff ff       	jmp    101e90 <__alltraps>

001020f6 <vector66>:
.globl vector66
vector66:
  pushl $0
  1020f6:	6a 00                	push   $0x0
  pushl $66
  1020f8:	6a 42                	push   $0x42
  jmp __alltraps
  1020fa:	e9 91 fd ff ff       	jmp    101e90 <__alltraps>

001020ff <vector67>:
.globl vector67
vector67:
  pushl $0
  1020ff:	6a 00                	push   $0x0
  pushl $67
  102101:	6a 43                	push   $0x43
  jmp __alltraps
  102103:	e9 88 fd ff ff       	jmp    101e90 <__alltraps>

00102108 <vector68>:
.globl vector68
vector68:
  pushl $0
  102108:	6a 00                	push   $0x0
  pushl $68
  10210a:	6a 44                	push   $0x44
  jmp __alltraps
  10210c:	e9 7f fd ff ff       	jmp    101e90 <__alltraps>

00102111 <vector69>:
.globl vector69
vector69:
  pushl $0
  102111:	6a 00                	push   $0x0
  pushl $69
  102113:	6a 45                	push   $0x45
  jmp __alltraps
  102115:	e9 76 fd ff ff       	jmp    101e90 <__alltraps>

0010211a <vector70>:
.globl vector70
vector70:
  pushl $0
  10211a:	6a 00                	push   $0x0
  pushl $70
  10211c:	6a 46                	push   $0x46
  jmp __alltraps
  10211e:	e9 6d fd ff ff       	jmp    101e90 <__alltraps>

00102123 <vector71>:
.globl vector71
vector71:
  pushl $0
  102123:	6a 00                	push   $0x0
  pushl $71
  102125:	6a 47                	push   $0x47
  jmp __alltraps
  102127:	e9 64 fd ff ff       	jmp    101e90 <__alltraps>

0010212c <vector72>:
.globl vector72
vector72:
  pushl $0
  10212c:	6a 00                	push   $0x0
  pushl $72
  10212e:	6a 48                	push   $0x48
  jmp __alltraps
  102130:	e9 5b fd ff ff       	jmp    101e90 <__alltraps>

00102135 <vector73>:
.globl vector73
vector73:
  pushl $0
  102135:	6a 00                	push   $0x0
  pushl $73
  102137:	6a 49                	push   $0x49
  jmp __alltraps
  102139:	e9 52 fd ff ff       	jmp    101e90 <__alltraps>

0010213e <vector74>:
.globl vector74
vector74:
  pushl $0
  10213e:	6a 00                	push   $0x0
  pushl $74
  102140:	6a 4a                	push   $0x4a
  jmp __alltraps
  102142:	e9 49 fd ff ff       	jmp    101e90 <__alltraps>

00102147 <vector75>:
.globl vector75
vector75:
  pushl $0
  102147:	6a 00                	push   $0x0
  pushl $75
  102149:	6a 4b                	push   $0x4b
  jmp __alltraps
  10214b:	e9 40 fd ff ff       	jmp    101e90 <__alltraps>

00102150 <vector76>:
.globl vector76
vector76:
  pushl $0
  102150:	6a 00                	push   $0x0
  pushl $76
  102152:	6a 4c                	push   $0x4c
  jmp __alltraps
  102154:	e9 37 fd ff ff       	jmp    101e90 <__alltraps>

00102159 <vector77>:
.globl vector77
vector77:
  pushl $0
  102159:	6a 00                	push   $0x0
  pushl $77
  10215b:	6a 4d                	push   $0x4d
  jmp __alltraps
  10215d:	e9 2e fd ff ff       	jmp    101e90 <__alltraps>

00102162 <vector78>:
.globl vector78
vector78:
  pushl $0
  102162:	6a 00                	push   $0x0
  pushl $78
  102164:	6a 4e                	push   $0x4e
  jmp __alltraps
  102166:	e9 25 fd ff ff       	jmp    101e90 <__alltraps>

0010216b <vector79>:
.globl vector79
vector79:
  pushl $0
  10216b:	6a 00                	push   $0x0
  pushl $79
  10216d:	6a 4f                	push   $0x4f
  jmp __alltraps
  10216f:	e9 1c fd ff ff       	jmp    101e90 <__alltraps>

00102174 <vector80>:
.globl vector80
vector80:
  pushl $0
  102174:	6a 00                	push   $0x0
  pushl $80
  102176:	6a 50                	push   $0x50
  jmp __alltraps
  102178:	e9 13 fd ff ff       	jmp    101e90 <__alltraps>

0010217d <vector81>:
.globl vector81
vector81:
  pushl $0
  10217d:	6a 00                	push   $0x0
  pushl $81
  10217f:	6a 51                	push   $0x51
  jmp __alltraps
  102181:	e9 0a fd ff ff       	jmp    101e90 <__alltraps>

00102186 <vector82>:
.globl vector82
vector82:
  pushl $0
  102186:	6a 00                	push   $0x0
  pushl $82
  102188:	6a 52                	push   $0x52
  jmp __alltraps
  10218a:	e9 01 fd ff ff       	jmp    101e90 <__alltraps>

0010218f <vector83>:
.globl vector83
vector83:
  pushl $0
  10218f:	6a 00                	push   $0x0
  pushl $83
  102191:	6a 53                	push   $0x53
  jmp __alltraps
  102193:	e9 f8 fc ff ff       	jmp    101e90 <__alltraps>

00102198 <vector84>:
.globl vector84
vector84:
  pushl $0
  102198:	6a 00                	push   $0x0
  pushl $84
  10219a:	6a 54                	push   $0x54
  jmp __alltraps
  10219c:	e9 ef fc ff ff       	jmp    101e90 <__alltraps>

001021a1 <vector85>:
.globl vector85
vector85:
  pushl $0
  1021a1:	6a 00                	push   $0x0
  pushl $85
  1021a3:	6a 55                	push   $0x55
  jmp __alltraps
  1021a5:	e9 e6 fc ff ff       	jmp    101e90 <__alltraps>

001021aa <vector86>:
.globl vector86
vector86:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $86
  1021ac:	6a 56                	push   $0x56
  jmp __alltraps
  1021ae:	e9 dd fc ff ff       	jmp    101e90 <__alltraps>

001021b3 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021b3:	6a 00                	push   $0x0
  pushl $87
  1021b5:	6a 57                	push   $0x57
  jmp __alltraps
  1021b7:	e9 d4 fc ff ff       	jmp    101e90 <__alltraps>

001021bc <vector88>:
.globl vector88
vector88:
  pushl $0
  1021bc:	6a 00                	push   $0x0
  pushl $88
  1021be:	6a 58                	push   $0x58
  jmp __alltraps
  1021c0:	e9 cb fc ff ff       	jmp    101e90 <__alltraps>

001021c5 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021c5:	6a 00                	push   $0x0
  pushl $89
  1021c7:	6a 59                	push   $0x59
  jmp __alltraps
  1021c9:	e9 c2 fc ff ff       	jmp    101e90 <__alltraps>

001021ce <vector90>:
.globl vector90
vector90:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $90
  1021d0:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021d2:	e9 b9 fc ff ff       	jmp    101e90 <__alltraps>

001021d7 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021d7:	6a 00                	push   $0x0
  pushl $91
  1021d9:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021db:	e9 b0 fc ff ff       	jmp    101e90 <__alltraps>

001021e0 <vector92>:
.globl vector92
vector92:
  pushl $0
  1021e0:	6a 00                	push   $0x0
  pushl $92
  1021e2:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021e4:	e9 a7 fc ff ff       	jmp    101e90 <__alltraps>

001021e9 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021e9:	6a 00                	push   $0x0
  pushl $93
  1021eb:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021ed:	e9 9e fc ff ff       	jmp    101e90 <__alltraps>

001021f2 <vector94>:
.globl vector94
vector94:
  pushl $0
  1021f2:	6a 00                	push   $0x0
  pushl $94
  1021f4:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021f6:	e9 95 fc ff ff       	jmp    101e90 <__alltraps>

001021fb <vector95>:
.globl vector95
vector95:
  pushl $0
  1021fb:	6a 00                	push   $0x0
  pushl $95
  1021fd:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021ff:	e9 8c fc ff ff       	jmp    101e90 <__alltraps>

00102204 <vector96>:
.globl vector96
vector96:
  pushl $0
  102204:	6a 00                	push   $0x0
  pushl $96
  102206:	6a 60                	push   $0x60
  jmp __alltraps
  102208:	e9 83 fc ff ff       	jmp    101e90 <__alltraps>

0010220d <vector97>:
.globl vector97
vector97:
  pushl $0
  10220d:	6a 00                	push   $0x0
  pushl $97
  10220f:	6a 61                	push   $0x61
  jmp __alltraps
  102211:	e9 7a fc ff ff       	jmp    101e90 <__alltraps>

00102216 <vector98>:
.globl vector98
vector98:
  pushl $0
  102216:	6a 00                	push   $0x0
  pushl $98
  102218:	6a 62                	push   $0x62
  jmp __alltraps
  10221a:	e9 71 fc ff ff       	jmp    101e90 <__alltraps>

0010221f <vector99>:
.globl vector99
vector99:
  pushl $0
  10221f:	6a 00                	push   $0x0
  pushl $99
  102221:	6a 63                	push   $0x63
  jmp __alltraps
  102223:	e9 68 fc ff ff       	jmp    101e90 <__alltraps>

00102228 <vector100>:
.globl vector100
vector100:
  pushl $0
  102228:	6a 00                	push   $0x0
  pushl $100
  10222a:	6a 64                	push   $0x64
  jmp __alltraps
  10222c:	e9 5f fc ff ff       	jmp    101e90 <__alltraps>

00102231 <vector101>:
.globl vector101
vector101:
  pushl $0
  102231:	6a 00                	push   $0x0
  pushl $101
  102233:	6a 65                	push   $0x65
  jmp __alltraps
  102235:	e9 56 fc ff ff       	jmp    101e90 <__alltraps>

0010223a <vector102>:
.globl vector102
vector102:
  pushl $0
  10223a:	6a 00                	push   $0x0
  pushl $102
  10223c:	6a 66                	push   $0x66
  jmp __alltraps
  10223e:	e9 4d fc ff ff       	jmp    101e90 <__alltraps>

00102243 <vector103>:
.globl vector103
vector103:
  pushl $0
  102243:	6a 00                	push   $0x0
  pushl $103
  102245:	6a 67                	push   $0x67
  jmp __alltraps
  102247:	e9 44 fc ff ff       	jmp    101e90 <__alltraps>

0010224c <vector104>:
.globl vector104
vector104:
  pushl $0
  10224c:	6a 00                	push   $0x0
  pushl $104
  10224e:	6a 68                	push   $0x68
  jmp __alltraps
  102250:	e9 3b fc ff ff       	jmp    101e90 <__alltraps>

00102255 <vector105>:
.globl vector105
vector105:
  pushl $0
  102255:	6a 00                	push   $0x0
  pushl $105
  102257:	6a 69                	push   $0x69
  jmp __alltraps
  102259:	e9 32 fc ff ff       	jmp    101e90 <__alltraps>

0010225e <vector106>:
.globl vector106
vector106:
  pushl $0
  10225e:	6a 00                	push   $0x0
  pushl $106
  102260:	6a 6a                	push   $0x6a
  jmp __alltraps
  102262:	e9 29 fc ff ff       	jmp    101e90 <__alltraps>

00102267 <vector107>:
.globl vector107
vector107:
  pushl $0
  102267:	6a 00                	push   $0x0
  pushl $107
  102269:	6a 6b                	push   $0x6b
  jmp __alltraps
  10226b:	e9 20 fc ff ff       	jmp    101e90 <__alltraps>

00102270 <vector108>:
.globl vector108
vector108:
  pushl $0
  102270:	6a 00                	push   $0x0
  pushl $108
  102272:	6a 6c                	push   $0x6c
  jmp __alltraps
  102274:	e9 17 fc ff ff       	jmp    101e90 <__alltraps>

00102279 <vector109>:
.globl vector109
vector109:
  pushl $0
  102279:	6a 00                	push   $0x0
  pushl $109
  10227b:	6a 6d                	push   $0x6d
  jmp __alltraps
  10227d:	e9 0e fc ff ff       	jmp    101e90 <__alltraps>

00102282 <vector110>:
.globl vector110
vector110:
  pushl $0
  102282:	6a 00                	push   $0x0
  pushl $110
  102284:	6a 6e                	push   $0x6e
  jmp __alltraps
  102286:	e9 05 fc ff ff       	jmp    101e90 <__alltraps>

0010228b <vector111>:
.globl vector111
vector111:
  pushl $0
  10228b:	6a 00                	push   $0x0
  pushl $111
  10228d:	6a 6f                	push   $0x6f
  jmp __alltraps
  10228f:	e9 fc fb ff ff       	jmp    101e90 <__alltraps>

00102294 <vector112>:
.globl vector112
vector112:
  pushl $0
  102294:	6a 00                	push   $0x0
  pushl $112
  102296:	6a 70                	push   $0x70
  jmp __alltraps
  102298:	e9 f3 fb ff ff       	jmp    101e90 <__alltraps>

0010229d <vector113>:
.globl vector113
vector113:
  pushl $0
  10229d:	6a 00                	push   $0x0
  pushl $113
  10229f:	6a 71                	push   $0x71
  jmp __alltraps
  1022a1:	e9 ea fb ff ff       	jmp    101e90 <__alltraps>

001022a6 <vector114>:
.globl vector114
vector114:
  pushl $0
  1022a6:	6a 00                	push   $0x0
  pushl $114
  1022a8:	6a 72                	push   $0x72
  jmp __alltraps
  1022aa:	e9 e1 fb ff ff       	jmp    101e90 <__alltraps>

001022af <vector115>:
.globl vector115
vector115:
  pushl $0
  1022af:	6a 00                	push   $0x0
  pushl $115
  1022b1:	6a 73                	push   $0x73
  jmp __alltraps
  1022b3:	e9 d8 fb ff ff       	jmp    101e90 <__alltraps>

001022b8 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022b8:	6a 00                	push   $0x0
  pushl $116
  1022ba:	6a 74                	push   $0x74
  jmp __alltraps
  1022bc:	e9 cf fb ff ff       	jmp    101e90 <__alltraps>

001022c1 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022c1:	6a 00                	push   $0x0
  pushl $117
  1022c3:	6a 75                	push   $0x75
  jmp __alltraps
  1022c5:	e9 c6 fb ff ff       	jmp    101e90 <__alltraps>

001022ca <vector118>:
.globl vector118
vector118:
  pushl $0
  1022ca:	6a 00                	push   $0x0
  pushl $118
  1022cc:	6a 76                	push   $0x76
  jmp __alltraps
  1022ce:	e9 bd fb ff ff       	jmp    101e90 <__alltraps>

001022d3 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022d3:	6a 00                	push   $0x0
  pushl $119
  1022d5:	6a 77                	push   $0x77
  jmp __alltraps
  1022d7:	e9 b4 fb ff ff       	jmp    101e90 <__alltraps>

001022dc <vector120>:
.globl vector120
vector120:
  pushl $0
  1022dc:	6a 00                	push   $0x0
  pushl $120
  1022de:	6a 78                	push   $0x78
  jmp __alltraps
  1022e0:	e9 ab fb ff ff       	jmp    101e90 <__alltraps>

001022e5 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022e5:	6a 00                	push   $0x0
  pushl $121
  1022e7:	6a 79                	push   $0x79
  jmp __alltraps
  1022e9:	e9 a2 fb ff ff       	jmp    101e90 <__alltraps>

001022ee <vector122>:
.globl vector122
vector122:
  pushl $0
  1022ee:	6a 00                	push   $0x0
  pushl $122
  1022f0:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022f2:	e9 99 fb ff ff       	jmp    101e90 <__alltraps>

001022f7 <vector123>:
.globl vector123
vector123:
  pushl $0
  1022f7:	6a 00                	push   $0x0
  pushl $123
  1022f9:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022fb:	e9 90 fb ff ff       	jmp    101e90 <__alltraps>

00102300 <vector124>:
.globl vector124
vector124:
  pushl $0
  102300:	6a 00                	push   $0x0
  pushl $124
  102302:	6a 7c                	push   $0x7c
  jmp __alltraps
  102304:	e9 87 fb ff ff       	jmp    101e90 <__alltraps>

00102309 <vector125>:
.globl vector125
vector125:
  pushl $0
  102309:	6a 00                	push   $0x0
  pushl $125
  10230b:	6a 7d                	push   $0x7d
  jmp __alltraps
  10230d:	e9 7e fb ff ff       	jmp    101e90 <__alltraps>

00102312 <vector126>:
.globl vector126
vector126:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $126
  102314:	6a 7e                	push   $0x7e
  jmp __alltraps
  102316:	e9 75 fb ff ff       	jmp    101e90 <__alltraps>

0010231b <vector127>:
.globl vector127
vector127:
  pushl $0
  10231b:	6a 00                	push   $0x0
  pushl $127
  10231d:	6a 7f                	push   $0x7f
  jmp __alltraps
  10231f:	e9 6c fb ff ff       	jmp    101e90 <__alltraps>

00102324 <vector128>:
.globl vector128
vector128:
  pushl $0
  102324:	6a 00                	push   $0x0
  pushl $128
  102326:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10232b:	e9 60 fb ff ff       	jmp    101e90 <__alltraps>

00102330 <vector129>:
.globl vector129
vector129:
  pushl $0
  102330:	6a 00                	push   $0x0
  pushl $129
  102332:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102337:	e9 54 fb ff ff       	jmp    101e90 <__alltraps>

0010233c <vector130>:
.globl vector130
vector130:
  pushl $0
  10233c:	6a 00                	push   $0x0
  pushl $130
  10233e:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102343:	e9 48 fb ff ff       	jmp    101e90 <__alltraps>

00102348 <vector131>:
.globl vector131
vector131:
  pushl $0
  102348:	6a 00                	push   $0x0
  pushl $131
  10234a:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10234f:	e9 3c fb ff ff       	jmp    101e90 <__alltraps>

00102354 <vector132>:
.globl vector132
vector132:
  pushl $0
  102354:	6a 00                	push   $0x0
  pushl $132
  102356:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10235b:	e9 30 fb ff ff       	jmp    101e90 <__alltraps>

00102360 <vector133>:
.globl vector133
vector133:
  pushl $0
  102360:	6a 00                	push   $0x0
  pushl $133
  102362:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102367:	e9 24 fb ff ff       	jmp    101e90 <__alltraps>

0010236c <vector134>:
.globl vector134
vector134:
  pushl $0
  10236c:	6a 00                	push   $0x0
  pushl $134
  10236e:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102373:	e9 18 fb ff ff       	jmp    101e90 <__alltraps>

00102378 <vector135>:
.globl vector135
vector135:
  pushl $0
  102378:	6a 00                	push   $0x0
  pushl $135
  10237a:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10237f:	e9 0c fb ff ff       	jmp    101e90 <__alltraps>

00102384 <vector136>:
.globl vector136
vector136:
  pushl $0
  102384:	6a 00                	push   $0x0
  pushl $136
  102386:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10238b:	e9 00 fb ff ff       	jmp    101e90 <__alltraps>

00102390 <vector137>:
.globl vector137
vector137:
  pushl $0
  102390:	6a 00                	push   $0x0
  pushl $137
  102392:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102397:	e9 f4 fa ff ff       	jmp    101e90 <__alltraps>

0010239c <vector138>:
.globl vector138
vector138:
  pushl $0
  10239c:	6a 00                	push   $0x0
  pushl $138
  10239e:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1023a3:	e9 e8 fa ff ff       	jmp    101e90 <__alltraps>

001023a8 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023a8:	6a 00                	push   $0x0
  pushl $139
  1023aa:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023af:	e9 dc fa ff ff       	jmp    101e90 <__alltraps>

001023b4 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023b4:	6a 00                	push   $0x0
  pushl $140
  1023b6:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023bb:	e9 d0 fa ff ff       	jmp    101e90 <__alltraps>

001023c0 <vector141>:
.globl vector141
vector141:
  pushl $0
  1023c0:	6a 00                	push   $0x0
  pushl $141
  1023c2:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023c7:	e9 c4 fa ff ff       	jmp    101e90 <__alltraps>

001023cc <vector142>:
.globl vector142
vector142:
  pushl $0
  1023cc:	6a 00                	push   $0x0
  pushl $142
  1023ce:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023d3:	e9 b8 fa ff ff       	jmp    101e90 <__alltraps>

001023d8 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023d8:	6a 00                	push   $0x0
  pushl $143
  1023da:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023df:	e9 ac fa ff ff       	jmp    101e90 <__alltraps>

001023e4 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023e4:	6a 00                	push   $0x0
  pushl $144
  1023e6:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023eb:	e9 a0 fa ff ff       	jmp    101e90 <__alltraps>

001023f0 <vector145>:
.globl vector145
vector145:
  pushl $0
  1023f0:	6a 00                	push   $0x0
  pushl $145
  1023f2:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023f7:	e9 94 fa ff ff       	jmp    101e90 <__alltraps>

001023fc <vector146>:
.globl vector146
vector146:
  pushl $0
  1023fc:	6a 00                	push   $0x0
  pushl $146
  1023fe:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102403:	e9 88 fa ff ff       	jmp    101e90 <__alltraps>

00102408 <vector147>:
.globl vector147
vector147:
  pushl $0
  102408:	6a 00                	push   $0x0
  pushl $147
  10240a:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10240f:	e9 7c fa ff ff       	jmp    101e90 <__alltraps>

00102414 <vector148>:
.globl vector148
vector148:
  pushl $0
  102414:	6a 00                	push   $0x0
  pushl $148
  102416:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10241b:	e9 70 fa ff ff       	jmp    101e90 <__alltraps>

00102420 <vector149>:
.globl vector149
vector149:
  pushl $0
  102420:	6a 00                	push   $0x0
  pushl $149
  102422:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102427:	e9 64 fa ff ff       	jmp    101e90 <__alltraps>

0010242c <vector150>:
.globl vector150
vector150:
  pushl $0
  10242c:	6a 00                	push   $0x0
  pushl $150
  10242e:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102433:	e9 58 fa ff ff       	jmp    101e90 <__alltraps>

00102438 <vector151>:
.globl vector151
vector151:
  pushl $0
  102438:	6a 00                	push   $0x0
  pushl $151
  10243a:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10243f:	e9 4c fa ff ff       	jmp    101e90 <__alltraps>

00102444 <vector152>:
.globl vector152
vector152:
  pushl $0
  102444:	6a 00                	push   $0x0
  pushl $152
  102446:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10244b:	e9 40 fa ff ff       	jmp    101e90 <__alltraps>

00102450 <vector153>:
.globl vector153
vector153:
  pushl $0
  102450:	6a 00                	push   $0x0
  pushl $153
  102452:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102457:	e9 34 fa ff ff       	jmp    101e90 <__alltraps>

0010245c <vector154>:
.globl vector154
vector154:
  pushl $0
  10245c:	6a 00                	push   $0x0
  pushl $154
  10245e:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102463:	e9 28 fa ff ff       	jmp    101e90 <__alltraps>

00102468 <vector155>:
.globl vector155
vector155:
  pushl $0
  102468:	6a 00                	push   $0x0
  pushl $155
  10246a:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10246f:	e9 1c fa ff ff       	jmp    101e90 <__alltraps>

00102474 <vector156>:
.globl vector156
vector156:
  pushl $0
  102474:	6a 00                	push   $0x0
  pushl $156
  102476:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10247b:	e9 10 fa ff ff       	jmp    101e90 <__alltraps>

00102480 <vector157>:
.globl vector157
vector157:
  pushl $0
  102480:	6a 00                	push   $0x0
  pushl $157
  102482:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102487:	e9 04 fa ff ff       	jmp    101e90 <__alltraps>

0010248c <vector158>:
.globl vector158
vector158:
  pushl $0
  10248c:	6a 00                	push   $0x0
  pushl $158
  10248e:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102493:	e9 f8 f9 ff ff       	jmp    101e90 <__alltraps>

00102498 <vector159>:
.globl vector159
vector159:
  pushl $0
  102498:	6a 00                	push   $0x0
  pushl $159
  10249a:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10249f:	e9 ec f9 ff ff       	jmp    101e90 <__alltraps>

001024a4 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024a4:	6a 00                	push   $0x0
  pushl $160
  1024a6:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024ab:	e9 e0 f9 ff ff       	jmp    101e90 <__alltraps>

001024b0 <vector161>:
.globl vector161
vector161:
  pushl $0
  1024b0:	6a 00                	push   $0x0
  pushl $161
  1024b2:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024b7:	e9 d4 f9 ff ff       	jmp    101e90 <__alltraps>

001024bc <vector162>:
.globl vector162
vector162:
  pushl $0
  1024bc:	6a 00                	push   $0x0
  pushl $162
  1024be:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024c3:	e9 c8 f9 ff ff       	jmp    101e90 <__alltraps>

001024c8 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024c8:	6a 00                	push   $0x0
  pushl $163
  1024ca:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024cf:	e9 bc f9 ff ff       	jmp    101e90 <__alltraps>

001024d4 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024d4:	6a 00                	push   $0x0
  pushl $164
  1024d6:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024db:	e9 b0 f9 ff ff       	jmp    101e90 <__alltraps>

001024e0 <vector165>:
.globl vector165
vector165:
  pushl $0
  1024e0:	6a 00                	push   $0x0
  pushl $165
  1024e2:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024e7:	e9 a4 f9 ff ff       	jmp    101e90 <__alltraps>

001024ec <vector166>:
.globl vector166
vector166:
  pushl $0
  1024ec:	6a 00                	push   $0x0
  pushl $166
  1024ee:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024f3:	e9 98 f9 ff ff       	jmp    101e90 <__alltraps>

001024f8 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024f8:	6a 00                	push   $0x0
  pushl $167
  1024fa:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024ff:	e9 8c f9 ff ff       	jmp    101e90 <__alltraps>

00102504 <vector168>:
.globl vector168
vector168:
  pushl $0
  102504:	6a 00                	push   $0x0
  pushl $168
  102506:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10250b:	e9 80 f9 ff ff       	jmp    101e90 <__alltraps>

00102510 <vector169>:
.globl vector169
vector169:
  pushl $0
  102510:	6a 00                	push   $0x0
  pushl $169
  102512:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102517:	e9 74 f9 ff ff       	jmp    101e90 <__alltraps>

0010251c <vector170>:
.globl vector170
vector170:
  pushl $0
  10251c:	6a 00                	push   $0x0
  pushl $170
  10251e:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102523:	e9 68 f9 ff ff       	jmp    101e90 <__alltraps>

00102528 <vector171>:
.globl vector171
vector171:
  pushl $0
  102528:	6a 00                	push   $0x0
  pushl $171
  10252a:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10252f:	e9 5c f9 ff ff       	jmp    101e90 <__alltraps>

00102534 <vector172>:
.globl vector172
vector172:
  pushl $0
  102534:	6a 00                	push   $0x0
  pushl $172
  102536:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10253b:	e9 50 f9 ff ff       	jmp    101e90 <__alltraps>

00102540 <vector173>:
.globl vector173
vector173:
  pushl $0
  102540:	6a 00                	push   $0x0
  pushl $173
  102542:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102547:	e9 44 f9 ff ff       	jmp    101e90 <__alltraps>

0010254c <vector174>:
.globl vector174
vector174:
  pushl $0
  10254c:	6a 00                	push   $0x0
  pushl $174
  10254e:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102553:	e9 38 f9 ff ff       	jmp    101e90 <__alltraps>

00102558 <vector175>:
.globl vector175
vector175:
  pushl $0
  102558:	6a 00                	push   $0x0
  pushl $175
  10255a:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10255f:	e9 2c f9 ff ff       	jmp    101e90 <__alltraps>

00102564 <vector176>:
.globl vector176
vector176:
  pushl $0
  102564:	6a 00                	push   $0x0
  pushl $176
  102566:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10256b:	e9 20 f9 ff ff       	jmp    101e90 <__alltraps>

00102570 <vector177>:
.globl vector177
vector177:
  pushl $0
  102570:	6a 00                	push   $0x0
  pushl $177
  102572:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102577:	e9 14 f9 ff ff       	jmp    101e90 <__alltraps>

0010257c <vector178>:
.globl vector178
vector178:
  pushl $0
  10257c:	6a 00                	push   $0x0
  pushl $178
  10257e:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102583:	e9 08 f9 ff ff       	jmp    101e90 <__alltraps>

00102588 <vector179>:
.globl vector179
vector179:
  pushl $0
  102588:	6a 00                	push   $0x0
  pushl $179
  10258a:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10258f:	e9 fc f8 ff ff       	jmp    101e90 <__alltraps>

00102594 <vector180>:
.globl vector180
vector180:
  pushl $0
  102594:	6a 00                	push   $0x0
  pushl $180
  102596:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10259b:	e9 f0 f8 ff ff       	jmp    101e90 <__alltraps>

001025a0 <vector181>:
.globl vector181
vector181:
  pushl $0
  1025a0:	6a 00                	push   $0x0
  pushl $181
  1025a2:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025a7:	e9 e4 f8 ff ff       	jmp    101e90 <__alltraps>

001025ac <vector182>:
.globl vector182
vector182:
  pushl $0
  1025ac:	6a 00                	push   $0x0
  pushl $182
  1025ae:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025b3:	e9 d8 f8 ff ff       	jmp    101e90 <__alltraps>

001025b8 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025b8:	6a 00                	push   $0x0
  pushl $183
  1025ba:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025bf:	e9 cc f8 ff ff       	jmp    101e90 <__alltraps>

001025c4 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025c4:	6a 00                	push   $0x0
  pushl $184
  1025c6:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025cb:	e9 c0 f8 ff ff       	jmp    101e90 <__alltraps>

001025d0 <vector185>:
.globl vector185
vector185:
  pushl $0
  1025d0:	6a 00                	push   $0x0
  pushl $185
  1025d2:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025d7:	e9 b4 f8 ff ff       	jmp    101e90 <__alltraps>

001025dc <vector186>:
.globl vector186
vector186:
  pushl $0
  1025dc:	6a 00                	push   $0x0
  pushl $186
  1025de:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025e3:	e9 a8 f8 ff ff       	jmp    101e90 <__alltraps>

001025e8 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025e8:	6a 00                	push   $0x0
  pushl $187
  1025ea:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025ef:	e9 9c f8 ff ff       	jmp    101e90 <__alltraps>

001025f4 <vector188>:
.globl vector188
vector188:
  pushl $0
  1025f4:	6a 00                	push   $0x0
  pushl $188
  1025f6:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025fb:	e9 90 f8 ff ff       	jmp    101e90 <__alltraps>

00102600 <vector189>:
.globl vector189
vector189:
  pushl $0
  102600:	6a 00                	push   $0x0
  pushl $189
  102602:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102607:	e9 84 f8 ff ff       	jmp    101e90 <__alltraps>

0010260c <vector190>:
.globl vector190
vector190:
  pushl $0
  10260c:	6a 00                	push   $0x0
  pushl $190
  10260e:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102613:	e9 78 f8 ff ff       	jmp    101e90 <__alltraps>

00102618 <vector191>:
.globl vector191
vector191:
  pushl $0
  102618:	6a 00                	push   $0x0
  pushl $191
  10261a:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10261f:	e9 6c f8 ff ff       	jmp    101e90 <__alltraps>

00102624 <vector192>:
.globl vector192
vector192:
  pushl $0
  102624:	6a 00                	push   $0x0
  pushl $192
  102626:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10262b:	e9 60 f8 ff ff       	jmp    101e90 <__alltraps>

00102630 <vector193>:
.globl vector193
vector193:
  pushl $0
  102630:	6a 00                	push   $0x0
  pushl $193
  102632:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102637:	e9 54 f8 ff ff       	jmp    101e90 <__alltraps>

0010263c <vector194>:
.globl vector194
vector194:
  pushl $0
  10263c:	6a 00                	push   $0x0
  pushl $194
  10263e:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102643:	e9 48 f8 ff ff       	jmp    101e90 <__alltraps>

00102648 <vector195>:
.globl vector195
vector195:
  pushl $0
  102648:	6a 00                	push   $0x0
  pushl $195
  10264a:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10264f:	e9 3c f8 ff ff       	jmp    101e90 <__alltraps>

00102654 <vector196>:
.globl vector196
vector196:
  pushl $0
  102654:	6a 00                	push   $0x0
  pushl $196
  102656:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10265b:	e9 30 f8 ff ff       	jmp    101e90 <__alltraps>

00102660 <vector197>:
.globl vector197
vector197:
  pushl $0
  102660:	6a 00                	push   $0x0
  pushl $197
  102662:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102667:	e9 24 f8 ff ff       	jmp    101e90 <__alltraps>

0010266c <vector198>:
.globl vector198
vector198:
  pushl $0
  10266c:	6a 00                	push   $0x0
  pushl $198
  10266e:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102673:	e9 18 f8 ff ff       	jmp    101e90 <__alltraps>

00102678 <vector199>:
.globl vector199
vector199:
  pushl $0
  102678:	6a 00                	push   $0x0
  pushl $199
  10267a:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10267f:	e9 0c f8 ff ff       	jmp    101e90 <__alltraps>

00102684 <vector200>:
.globl vector200
vector200:
  pushl $0
  102684:	6a 00                	push   $0x0
  pushl $200
  102686:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10268b:	e9 00 f8 ff ff       	jmp    101e90 <__alltraps>

00102690 <vector201>:
.globl vector201
vector201:
  pushl $0
  102690:	6a 00                	push   $0x0
  pushl $201
  102692:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102697:	e9 f4 f7 ff ff       	jmp    101e90 <__alltraps>

0010269c <vector202>:
.globl vector202
vector202:
  pushl $0
  10269c:	6a 00                	push   $0x0
  pushl $202
  10269e:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1026a3:	e9 e8 f7 ff ff       	jmp    101e90 <__alltraps>

001026a8 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026a8:	6a 00                	push   $0x0
  pushl $203
  1026aa:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026af:	e9 dc f7 ff ff       	jmp    101e90 <__alltraps>

001026b4 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026b4:	6a 00                	push   $0x0
  pushl $204
  1026b6:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026bb:	e9 d0 f7 ff ff       	jmp    101e90 <__alltraps>

001026c0 <vector205>:
.globl vector205
vector205:
  pushl $0
  1026c0:	6a 00                	push   $0x0
  pushl $205
  1026c2:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026c7:	e9 c4 f7 ff ff       	jmp    101e90 <__alltraps>

001026cc <vector206>:
.globl vector206
vector206:
  pushl $0
  1026cc:	6a 00                	push   $0x0
  pushl $206
  1026ce:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026d3:	e9 b8 f7 ff ff       	jmp    101e90 <__alltraps>

001026d8 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026d8:	6a 00                	push   $0x0
  pushl $207
  1026da:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026df:	e9 ac f7 ff ff       	jmp    101e90 <__alltraps>

001026e4 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026e4:	6a 00                	push   $0x0
  pushl $208
  1026e6:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026eb:	e9 a0 f7 ff ff       	jmp    101e90 <__alltraps>

001026f0 <vector209>:
.globl vector209
vector209:
  pushl $0
  1026f0:	6a 00                	push   $0x0
  pushl $209
  1026f2:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026f7:	e9 94 f7 ff ff       	jmp    101e90 <__alltraps>

001026fc <vector210>:
.globl vector210
vector210:
  pushl $0
  1026fc:	6a 00                	push   $0x0
  pushl $210
  1026fe:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102703:	e9 88 f7 ff ff       	jmp    101e90 <__alltraps>

00102708 <vector211>:
.globl vector211
vector211:
  pushl $0
  102708:	6a 00                	push   $0x0
  pushl $211
  10270a:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10270f:	e9 7c f7 ff ff       	jmp    101e90 <__alltraps>

00102714 <vector212>:
.globl vector212
vector212:
  pushl $0
  102714:	6a 00                	push   $0x0
  pushl $212
  102716:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10271b:	e9 70 f7 ff ff       	jmp    101e90 <__alltraps>

00102720 <vector213>:
.globl vector213
vector213:
  pushl $0
  102720:	6a 00                	push   $0x0
  pushl $213
  102722:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102727:	e9 64 f7 ff ff       	jmp    101e90 <__alltraps>

0010272c <vector214>:
.globl vector214
vector214:
  pushl $0
  10272c:	6a 00                	push   $0x0
  pushl $214
  10272e:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102733:	e9 58 f7 ff ff       	jmp    101e90 <__alltraps>

00102738 <vector215>:
.globl vector215
vector215:
  pushl $0
  102738:	6a 00                	push   $0x0
  pushl $215
  10273a:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10273f:	e9 4c f7 ff ff       	jmp    101e90 <__alltraps>

00102744 <vector216>:
.globl vector216
vector216:
  pushl $0
  102744:	6a 00                	push   $0x0
  pushl $216
  102746:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10274b:	e9 40 f7 ff ff       	jmp    101e90 <__alltraps>

00102750 <vector217>:
.globl vector217
vector217:
  pushl $0
  102750:	6a 00                	push   $0x0
  pushl $217
  102752:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102757:	e9 34 f7 ff ff       	jmp    101e90 <__alltraps>

0010275c <vector218>:
.globl vector218
vector218:
  pushl $0
  10275c:	6a 00                	push   $0x0
  pushl $218
  10275e:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102763:	e9 28 f7 ff ff       	jmp    101e90 <__alltraps>

00102768 <vector219>:
.globl vector219
vector219:
  pushl $0
  102768:	6a 00                	push   $0x0
  pushl $219
  10276a:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10276f:	e9 1c f7 ff ff       	jmp    101e90 <__alltraps>

00102774 <vector220>:
.globl vector220
vector220:
  pushl $0
  102774:	6a 00                	push   $0x0
  pushl $220
  102776:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10277b:	e9 10 f7 ff ff       	jmp    101e90 <__alltraps>

00102780 <vector221>:
.globl vector221
vector221:
  pushl $0
  102780:	6a 00                	push   $0x0
  pushl $221
  102782:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102787:	e9 04 f7 ff ff       	jmp    101e90 <__alltraps>

0010278c <vector222>:
.globl vector222
vector222:
  pushl $0
  10278c:	6a 00                	push   $0x0
  pushl $222
  10278e:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102793:	e9 f8 f6 ff ff       	jmp    101e90 <__alltraps>

00102798 <vector223>:
.globl vector223
vector223:
  pushl $0
  102798:	6a 00                	push   $0x0
  pushl $223
  10279a:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10279f:	e9 ec f6 ff ff       	jmp    101e90 <__alltraps>

001027a4 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027a4:	6a 00                	push   $0x0
  pushl $224
  1027a6:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027ab:	e9 e0 f6 ff ff       	jmp    101e90 <__alltraps>

001027b0 <vector225>:
.globl vector225
vector225:
  pushl $0
  1027b0:	6a 00                	push   $0x0
  pushl $225
  1027b2:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027b7:	e9 d4 f6 ff ff       	jmp    101e90 <__alltraps>

001027bc <vector226>:
.globl vector226
vector226:
  pushl $0
  1027bc:	6a 00                	push   $0x0
  pushl $226
  1027be:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027c3:	e9 c8 f6 ff ff       	jmp    101e90 <__alltraps>

001027c8 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027c8:	6a 00                	push   $0x0
  pushl $227
  1027ca:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027cf:	e9 bc f6 ff ff       	jmp    101e90 <__alltraps>

001027d4 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027d4:	6a 00                	push   $0x0
  pushl $228
  1027d6:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027db:	e9 b0 f6 ff ff       	jmp    101e90 <__alltraps>

001027e0 <vector229>:
.globl vector229
vector229:
  pushl $0
  1027e0:	6a 00                	push   $0x0
  pushl $229
  1027e2:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027e7:	e9 a4 f6 ff ff       	jmp    101e90 <__alltraps>

001027ec <vector230>:
.globl vector230
vector230:
  pushl $0
  1027ec:	6a 00                	push   $0x0
  pushl $230
  1027ee:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027f3:	e9 98 f6 ff ff       	jmp    101e90 <__alltraps>

001027f8 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027f8:	6a 00                	push   $0x0
  pushl $231
  1027fa:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027ff:	e9 8c f6 ff ff       	jmp    101e90 <__alltraps>

00102804 <vector232>:
.globl vector232
vector232:
  pushl $0
  102804:	6a 00                	push   $0x0
  pushl $232
  102806:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10280b:	e9 80 f6 ff ff       	jmp    101e90 <__alltraps>

00102810 <vector233>:
.globl vector233
vector233:
  pushl $0
  102810:	6a 00                	push   $0x0
  pushl $233
  102812:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102817:	e9 74 f6 ff ff       	jmp    101e90 <__alltraps>

0010281c <vector234>:
.globl vector234
vector234:
  pushl $0
  10281c:	6a 00                	push   $0x0
  pushl $234
  10281e:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102823:	e9 68 f6 ff ff       	jmp    101e90 <__alltraps>

00102828 <vector235>:
.globl vector235
vector235:
  pushl $0
  102828:	6a 00                	push   $0x0
  pushl $235
  10282a:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10282f:	e9 5c f6 ff ff       	jmp    101e90 <__alltraps>

00102834 <vector236>:
.globl vector236
vector236:
  pushl $0
  102834:	6a 00                	push   $0x0
  pushl $236
  102836:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10283b:	e9 50 f6 ff ff       	jmp    101e90 <__alltraps>

00102840 <vector237>:
.globl vector237
vector237:
  pushl $0
  102840:	6a 00                	push   $0x0
  pushl $237
  102842:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102847:	e9 44 f6 ff ff       	jmp    101e90 <__alltraps>

0010284c <vector238>:
.globl vector238
vector238:
  pushl $0
  10284c:	6a 00                	push   $0x0
  pushl $238
  10284e:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102853:	e9 38 f6 ff ff       	jmp    101e90 <__alltraps>

00102858 <vector239>:
.globl vector239
vector239:
  pushl $0
  102858:	6a 00                	push   $0x0
  pushl $239
  10285a:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10285f:	e9 2c f6 ff ff       	jmp    101e90 <__alltraps>

00102864 <vector240>:
.globl vector240
vector240:
  pushl $0
  102864:	6a 00                	push   $0x0
  pushl $240
  102866:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10286b:	e9 20 f6 ff ff       	jmp    101e90 <__alltraps>

00102870 <vector241>:
.globl vector241
vector241:
  pushl $0
  102870:	6a 00                	push   $0x0
  pushl $241
  102872:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102877:	e9 14 f6 ff ff       	jmp    101e90 <__alltraps>

0010287c <vector242>:
.globl vector242
vector242:
  pushl $0
  10287c:	6a 00                	push   $0x0
  pushl $242
  10287e:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102883:	e9 08 f6 ff ff       	jmp    101e90 <__alltraps>

00102888 <vector243>:
.globl vector243
vector243:
  pushl $0
  102888:	6a 00                	push   $0x0
  pushl $243
  10288a:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10288f:	e9 fc f5 ff ff       	jmp    101e90 <__alltraps>

00102894 <vector244>:
.globl vector244
vector244:
  pushl $0
  102894:	6a 00                	push   $0x0
  pushl $244
  102896:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10289b:	e9 f0 f5 ff ff       	jmp    101e90 <__alltraps>

001028a0 <vector245>:
.globl vector245
vector245:
  pushl $0
  1028a0:	6a 00                	push   $0x0
  pushl $245
  1028a2:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028a7:	e9 e4 f5 ff ff       	jmp    101e90 <__alltraps>

001028ac <vector246>:
.globl vector246
vector246:
  pushl $0
  1028ac:	6a 00                	push   $0x0
  pushl $246
  1028ae:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028b3:	e9 d8 f5 ff ff       	jmp    101e90 <__alltraps>

001028b8 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028b8:	6a 00                	push   $0x0
  pushl $247
  1028ba:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028bf:	e9 cc f5 ff ff       	jmp    101e90 <__alltraps>

001028c4 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028c4:	6a 00                	push   $0x0
  pushl $248
  1028c6:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028cb:	e9 c0 f5 ff ff       	jmp    101e90 <__alltraps>

001028d0 <vector249>:
.globl vector249
vector249:
  pushl $0
  1028d0:	6a 00                	push   $0x0
  pushl $249
  1028d2:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028d7:	e9 b4 f5 ff ff       	jmp    101e90 <__alltraps>

001028dc <vector250>:
.globl vector250
vector250:
  pushl $0
  1028dc:	6a 00                	push   $0x0
  pushl $250
  1028de:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028e3:	e9 a8 f5 ff ff       	jmp    101e90 <__alltraps>

001028e8 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028e8:	6a 00                	push   $0x0
  pushl $251
  1028ea:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028ef:	e9 9c f5 ff ff       	jmp    101e90 <__alltraps>

001028f4 <vector252>:
.globl vector252
vector252:
  pushl $0
  1028f4:	6a 00                	push   $0x0
  pushl $252
  1028f6:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028fb:	e9 90 f5 ff ff       	jmp    101e90 <__alltraps>

00102900 <vector253>:
.globl vector253
vector253:
  pushl $0
  102900:	6a 00                	push   $0x0
  pushl $253
  102902:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102907:	e9 84 f5 ff ff       	jmp    101e90 <__alltraps>

0010290c <vector254>:
.globl vector254
vector254:
  pushl $0
  10290c:	6a 00                	push   $0x0
  pushl $254
  10290e:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102913:	e9 78 f5 ff ff       	jmp    101e90 <__alltraps>

00102918 <vector255>:
.globl vector255
vector255:
  pushl $0
  102918:	6a 00                	push   $0x0
  pushl $255
  10291a:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10291f:	e9 6c f5 ff ff       	jmp    101e90 <__alltraps>

00102924 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102924:	55                   	push   %ebp
  102925:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102927:	8b 45 08             	mov    0x8(%ebp),%eax
  10292a:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10292d:	b8 23 00 00 00       	mov    $0x23,%eax
  102932:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102934:	b8 23 00 00 00       	mov    $0x23,%eax
  102939:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10293b:	b8 10 00 00 00       	mov    $0x10,%eax
  102940:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102942:	b8 10 00 00 00       	mov    $0x10,%eax
  102947:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102949:	b8 10 00 00 00       	mov    $0x10,%eax
  10294e:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102950:	ea 57 29 10 00 08 00 	ljmp   $0x8,$0x102957
}
  102957:	5d                   	pop    %ebp
  102958:	c3                   	ret    

00102959 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102959:	55                   	push   %ebp
  10295a:	89 e5                	mov    %esp,%ebp
  10295c:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10295f:	b8 80 f9 10 00       	mov    $0x10f980,%eax
  102964:	05 00 04 00 00       	add    $0x400,%eax
  102969:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  10296e:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102975:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102977:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  10297e:	68 00 
  102980:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102985:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  10298b:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102990:	c1 e8 10             	shr    $0x10,%eax
  102993:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102998:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10299f:	83 e0 f0             	and    $0xfffffff0,%eax
  1029a2:	83 c8 09             	or     $0x9,%eax
  1029a5:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029aa:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029b1:	83 c8 10             	or     $0x10,%eax
  1029b4:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029b9:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029c0:	83 e0 9f             	and    $0xffffff9f,%eax
  1029c3:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029c8:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1029cf:	83 c8 80             	or     $0xffffff80,%eax
  1029d2:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1029d7:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029de:	83 e0 f0             	and    $0xfffffff0,%eax
  1029e1:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029e6:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029ed:	83 e0 ef             	and    $0xffffffef,%eax
  1029f0:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1029f5:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1029fc:	83 e0 df             	and    $0xffffffdf,%eax
  1029ff:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a04:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a0b:	83 c8 40             	or     $0x40,%eax
  102a0e:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a13:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a1a:	83 e0 7f             	and    $0x7f,%eax
  102a1d:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a22:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a27:	c1 e8 18             	shr    $0x18,%eax
  102a2a:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102a2f:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a36:	83 e0 ef             	and    $0xffffffef,%eax
  102a39:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a3e:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102a45:	e8 da fe ff ff       	call   102924 <lgdt>
  102a4a:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a50:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a54:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102a57:	c9                   	leave  
  102a58:	c3                   	ret    

00102a59 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a59:	55                   	push   %ebp
  102a5a:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a5c:	e8 f8 fe ff ff       	call   102959 <gdt_init>
}
  102a61:	5d                   	pop    %ebp
  102a62:	c3                   	ret    
	...

00102a64 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102a64:	55                   	push   %ebp
  102a65:	89 e5                	mov    %esp,%ebp
  102a67:	56                   	push   %esi
  102a68:	53                   	push   %ebx
  102a69:	83 ec 60             	sub    $0x60,%esp
  102a6c:	8b 45 10             	mov    0x10(%ebp),%eax
  102a6f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102a72:	8b 45 14             	mov    0x14(%ebp),%eax
  102a75:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102a78:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102a7b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102a7e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a81:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102a84:	8b 45 18             	mov    0x18(%ebp),%eax
  102a87:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102a8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102a8d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102a90:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102a93:	89 55 cc             	mov    %edx,-0x34(%ebp)
  102a96:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102a99:	8b 55 cc             	mov    -0x34(%ebp),%edx
  102a9c:	89 d3                	mov    %edx,%ebx
  102a9e:	89 c6                	mov    %eax,%esi
  102aa0:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102aa3:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  102aa6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102aa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102aac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102ab0:	74 1c                	je     102ace <printnum+0x6a>
  102ab2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ab5:	ba 00 00 00 00       	mov    $0x0,%edx
  102aba:	f7 75 e4             	divl   -0x1c(%ebp)
  102abd:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102ac0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ac3:	ba 00 00 00 00       	mov    $0x0,%edx
  102ac8:	f7 75 e4             	divl   -0x1c(%ebp)
  102acb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ace:	8b 55 e0             	mov    -0x20(%ebp),%edx
  102ad1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ad4:	89 d6                	mov    %edx,%esi
  102ad6:	89 c3                	mov    %eax,%ebx
  102ad8:	89 f0                	mov    %esi,%eax
  102ada:	89 da                	mov    %ebx,%edx
  102adc:	f7 75 e4             	divl   -0x1c(%ebp)
  102adf:	89 d3                	mov    %edx,%ebx
  102ae1:	89 c6                	mov    %eax,%esi
  102ae3:	89 75 e0             	mov    %esi,-0x20(%ebp)
  102ae6:	89 5d dc             	mov    %ebx,-0x24(%ebp)
  102ae9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102aec:	89 45 c8             	mov    %eax,-0x38(%ebp)
  102aef:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102af2:	89 55 c4             	mov    %edx,-0x3c(%ebp)
  102af5:	8b 45 c8             	mov    -0x38(%ebp),%eax
  102af8:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  102afb:	89 c3                	mov    %eax,%ebx
  102afd:	89 d6                	mov    %edx,%esi
  102aff:	89 5d e8             	mov    %ebx,-0x18(%ebp)
  102b02:	89 75 ec             	mov    %esi,-0x14(%ebp)
  102b05:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b08:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102b0b:	8b 45 18             	mov    0x18(%ebp),%eax
  102b0e:	ba 00 00 00 00       	mov    $0x0,%edx
  102b13:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b16:	77 56                	ja     102b6e <printnum+0x10a>
  102b18:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102b1b:	72 05                	jb     102b22 <printnum+0xbe>
  102b1d:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102b20:	77 4c                	ja     102b6e <printnum+0x10a>
        printnum(putch, putdat, result, base, width - 1, padc);
  102b22:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102b25:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b28:	8b 45 20             	mov    0x20(%ebp),%eax
  102b2b:	89 44 24 18          	mov    %eax,0x18(%esp)
  102b2f:	89 54 24 14          	mov    %edx,0x14(%esp)
  102b33:	8b 45 18             	mov    0x18(%ebp),%eax
  102b36:	89 44 24 10          	mov    %eax,0x10(%esp)
  102b3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b3d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102b40:	89 44 24 08          	mov    %eax,0x8(%esp)
  102b44:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102b48:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b4b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102b52:	89 04 24             	mov    %eax,(%esp)
  102b55:	e8 0a ff ff ff       	call   102a64 <printnum>
  102b5a:	eb 1c                	jmp    102b78 <printnum+0x114>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102b5c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b5f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b63:	8b 45 20             	mov    0x20(%ebp),%eax
  102b66:	89 04 24             	mov    %eax,(%esp)
  102b69:	8b 45 08             	mov    0x8(%ebp),%eax
  102b6c:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102b6e:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102b72:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102b76:	7f e4                	jg     102b5c <printnum+0xf8>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102b7b:	05 b0 3d 10 00       	add    $0x103db0,%eax
  102b80:	0f b6 00             	movzbl (%eax),%eax
  102b83:	0f be c0             	movsbl %al,%eax
  102b86:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b89:	89 54 24 04          	mov    %edx,0x4(%esp)
  102b8d:	89 04 24             	mov    %eax,(%esp)
  102b90:	8b 45 08             	mov    0x8(%ebp),%eax
  102b93:	ff d0                	call   *%eax
}
  102b95:	83 c4 60             	add    $0x60,%esp
  102b98:	5b                   	pop    %ebx
  102b99:	5e                   	pop    %esi
  102b9a:	5d                   	pop    %ebp
  102b9b:	c3                   	ret    

00102b9c <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102b9c:	55                   	push   %ebp
  102b9d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102b9f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102ba3:	7e 14                	jle    102bb9 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102ba5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ba8:	8b 00                	mov    (%eax),%eax
  102baa:	8d 48 08             	lea    0x8(%eax),%ecx
  102bad:	8b 55 08             	mov    0x8(%ebp),%edx
  102bb0:	89 0a                	mov    %ecx,(%edx)
  102bb2:	8b 50 04             	mov    0x4(%eax),%edx
  102bb5:	8b 00                	mov    (%eax),%eax
  102bb7:	eb 30                	jmp    102be9 <getuint+0x4d>
    }
    else if (lflag) {
  102bb9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102bbd:	74 16                	je     102bd5 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102bbf:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc2:	8b 00                	mov    (%eax),%eax
  102bc4:	8d 48 04             	lea    0x4(%eax),%ecx
  102bc7:	8b 55 08             	mov    0x8(%ebp),%edx
  102bca:	89 0a                	mov    %ecx,(%edx)
  102bcc:	8b 00                	mov    (%eax),%eax
  102bce:	ba 00 00 00 00       	mov    $0x0,%edx
  102bd3:	eb 14                	jmp    102be9 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102bd5:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd8:	8b 00                	mov    (%eax),%eax
  102bda:	8d 48 04             	lea    0x4(%eax),%ecx
  102bdd:	8b 55 08             	mov    0x8(%ebp),%edx
  102be0:	89 0a                	mov    %ecx,(%edx)
  102be2:	8b 00                	mov    (%eax),%eax
  102be4:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102be9:	5d                   	pop    %ebp
  102bea:	c3                   	ret    

00102beb <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102beb:	55                   	push   %ebp
  102bec:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102bee:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102bf2:	7e 14                	jle    102c08 <getint+0x1d>
        return va_arg(*ap, long long);
  102bf4:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf7:	8b 00                	mov    (%eax),%eax
  102bf9:	8d 48 08             	lea    0x8(%eax),%ecx
  102bfc:	8b 55 08             	mov    0x8(%ebp),%edx
  102bff:	89 0a                	mov    %ecx,(%edx)
  102c01:	8b 50 04             	mov    0x4(%eax),%edx
  102c04:	8b 00                	mov    (%eax),%eax
  102c06:	eb 30                	jmp    102c38 <getint+0x4d>
    }
    else if (lflag) {
  102c08:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102c0c:	74 16                	je     102c24 <getint+0x39>
        return va_arg(*ap, long);
  102c0e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c11:	8b 00                	mov    (%eax),%eax
  102c13:	8d 48 04             	lea    0x4(%eax),%ecx
  102c16:	8b 55 08             	mov    0x8(%ebp),%edx
  102c19:	89 0a                	mov    %ecx,(%edx)
  102c1b:	8b 00                	mov    (%eax),%eax
  102c1d:	89 c2                	mov    %eax,%edx
  102c1f:	c1 fa 1f             	sar    $0x1f,%edx
  102c22:	eb 14                	jmp    102c38 <getint+0x4d>
    }
    else {
        return va_arg(*ap, int);
  102c24:	8b 45 08             	mov    0x8(%ebp),%eax
  102c27:	8b 00                	mov    (%eax),%eax
  102c29:	8d 48 04             	lea    0x4(%eax),%ecx
  102c2c:	8b 55 08             	mov    0x8(%ebp),%edx
  102c2f:	89 0a                	mov    %ecx,(%edx)
  102c31:	8b 00                	mov    (%eax),%eax
  102c33:	89 c2                	mov    %eax,%edx
  102c35:	c1 fa 1f             	sar    $0x1f,%edx
    }
}
  102c38:	5d                   	pop    %ebp
  102c39:	c3                   	ret    

00102c3a <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102c3a:	55                   	push   %ebp
  102c3b:	89 e5                	mov    %esp,%ebp
  102c3d:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102c40:	8d 55 14             	lea    0x14(%ebp),%edx
  102c43:	8d 45 f4             	lea    -0xc(%ebp),%eax
  102c46:	89 10                	mov    %edx,(%eax)
    vprintfmt(putch, putdat, fmt, ap);
  102c48:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102c4b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102c4f:	8b 45 10             	mov    0x10(%ebp),%eax
  102c52:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c56:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c59:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c5d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c60:	89 04 24             	mov    %eax,(%esp)
  102c63:	e8 02 00 00 00       	call   102c6a <vprintfmt>
    va_end(ap);
}
  102c68:	c9                   	leave  
  102c69:	c3                   	ret    

00102c6a <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102c6a:	55                   	push   %ebp
  102c6b:	89 e5                	mov    %esp,%ebp
  102c6d:	56                   	push   %esi
  102c6e:	53                   	push   %ebx
  102c6f:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c72:	eb 17                	jmp    102c8b <vprintfmt+0x21>
            if (ch == '\0') {
  102c74:	85 db                	test   %ebx,%ebx
  102c76:	0f 84 db 03 00 00    	je     103057 <vprintfmt+0x3ed>
                return;
            }
            putch(ch, putdat);
  102c7c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c83:	89 1c 24             	mov    %ebx,(%esp)
  102c86:	8b 45 08             	mov    0x8(%ebp),%eax
  102c89:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c8b:	8b 45 10             	mov    0x10(%ebp),%eax
  102c8e:	0f b6 00             	movzbl (%eax),%eax
  102c91:	0f b6 d8             	movzbl %al,%ebx
  102c94:	83 fb 25             	cmp    $0x25,%ebx
  102c97:	0f 95 c0             	setne  %al
  102c9a:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102c9e:	84 c0                	test   %al,%al
  102ca0:	75 d2                	jne    102c74 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102ca2:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ca6:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102cad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102cb0:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102cb3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102cba:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102cbd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cc0:	eb 04                	jmp    102cc6 <vprintfmt+0x5c>
            goto process_precision;

        case '.':
            if (width < 0)
                width = 0;
            goto reswitch;
  102cc2:	90                   	nop
  102cc3:	eb 01                	jmp    102cc6 <vprintfmt+0x5c>
            goto reswitch;

        process_precision:
            if (width < 0)
                width = precision, precision = -1;
            goto reswitch;
  102cc5:	90                   	nop
        char padc = ' ';
        width = precision = -1;
        lflag = altflag = 0;

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102cc6:	8b 45 10             	mov    0x10(%ebp),%eax
  102cc9:	0f b6 00             	movzbl (%eax),%eax
  102ccc:	0f b6 d8             	movzbl %al,%ebx
  102ccf:	89 d8                	mov    %ebx,%eax
  102cd1:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  102cd5:	83 e8 23             	sub    $0x23,%eax
  102cd8:	83 f8 55             	cmp    $0x55,%eax
  102cdb:	0f 87 45 03 00 00    	ja     103026 <vprintfmt+0x3bc>
  102ce1:	8b 04 85 d4 3d 10 00 	mov    0x103dd4(,%eax,4),%eax
  102ce8:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102cea:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102cee:	eb d6                	jmp    102cc6 <vprintfmt+0x5c>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102cf0:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102cf4:	eb d0                	jmp    102cc6 <vprintfmt+0x5c>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102cf6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102cfd:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102d00:	89 d0                	mov    %edx,%eax
  102d02:	c1 e0 02             	shl    $0x2,%eax
  102d05:	01 d0                	add    %edx,%eax
  102d07:	01 c0                	add    %eax,%eax
  102d09:	01 d8                	add    %ebx,%eax
  102d0b:	83 e8 30             	sub    $0x30,%eax
  102d0e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102d11:	8b 45 10             	mov    0x10(%ebp),%eax
  102d14:	0f b6 00             	movzbl (%eax),%eax
  102d17:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102d1a:	83 fb 2f             	cmp    $0x2f,%ebx
  102d1d:	7e 39                	jle    102d58 <vprintfmt+0xee>
  102d1f:	83 fb 39             	cmp    $0x39,%ebx
  102d22:	7f 34                	jg     102d58 <vprintfmt+0xee>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102d24:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102d28:	eb d3                	jmp    102cfd <vprintfmt+0x93>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102d2a:	8b 45 14             	mov    0x14(%ebp),%eax
  102d2d:	8d 50 04             	lea    0x4(%eax),%edx
  102d30:	89 55 14             	mov    %edx,0x14(%ebp)
  102d33:	8b 00                	mov    (%eax),%eax
  102d35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102d38:	eb 1f                	jmp    102d59 <vprintfmt+0xef>

        case '.':
            if (width < 0)
  102d3a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d3e:	79 82                	jns    102cc2 <vprintfmt+0x58>
                width = 0;
  102d40:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102d47:	e9 76 ff ff ff       	jmp    102cc2 <vprintfmt+0x58>

        case '#':
            altflag = 1;
  102d4c:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102d53:	e9 6e ff ff ff       	jmp    102cc6 <vprintfmt+0x5c>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  102d58:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  102d59:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d5d:	0f 89 62 ff ff ff    	jns    102cc5 <vprintfmt+0x5b>
                width = precision, precision = -1;
  102d63:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102d66:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102d69:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102d70:	e9 50 ff ff ff       	jmp    102cc5 <vprintfmt+0x5b>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102d75:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102d79:	e9 48 ff ff ff       	jmp    102cc6 <vprintfmt+0x5c>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102d7e:	8b 45 14             	mov    0x14(%ebp),%eax
  102d81:	8d 50 04             	lea    0x4(%eax),%edx
  102d84:	89 55 14             	mov    %edx,0x14(%ebp)
  102d87:	8b 00                	mov    (%eax),%eax
  102d89:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d8c:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d90:	89 04 24             	mov    %eax,(%esp)
  102d93:	8b 45 08             	mov    0x8(%ebp),%eax
  102d96:	ff d0                	call   *%eax
            break;
  102d98:	e9 b4 02 00 00       	jmp    103051 <vprintfmt+0x3e7>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102d9d:	8b 45 14             	mov    0x14(%ebp),%eax
  102da0:	8d 50 04             	lea    0x4(%eax),%edx
  102da3:	89 55 14             	mov    %edx,0x14(%ebp)
  102da6:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102da8:	85 db                	test   %ebx,%ebx
  102daa:	79 02                	jns    102dae <vprintfmt+0x144>
                err = -err;
  102dac:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102dae:	83 fb 06             	cmp    $0x6,%ebx
  102db1:	7f 0b                	jg     102dbe <vprintfmt+0x154>
  102db3:	8b 34 9d 94 3d 10 00 	mov    0x103d94(,%ebx,4),%esi
  102dba:	85 f6                	test   %esi,%esi
  102dbc:	75 23                	jne    102de1 <vprintfmt+0x177>
                printfmt(putch, putdat, "error %d", err);
  102dbe:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102dc2:	c7 44 24 08 c1 3d 10 	movl   $0x103dc1,0x8(%esp)
  102dc9:	00 
  102dca:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dcd:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dd1:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd4:	89 04 24             	mov    %eax,(%esp)
  102dd7:	e8 5e fe ff ff       	call   102c3a <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102ddc:	e9 70 02 00 00       	jmp    103051 <vprintfmt+0x3e7>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102de1:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102de5:	c7 44 24 08 ca 3d 10 	movl   $0x103dca,0x8(%esp)
  102dec:	00 
  102ded:	8b 45 0c             	mov    0xc(%ebp),%eax
  102df0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102df4:	8b 45 08             	mov    0x8(%ebp),%eax
  102df7:	89 04 24             	mov    %eax,(%esp)
  102dfa:	e8 3b fe ff ff       	call   102c3a <printfmt>
            }
            break;
  102dff:	e9 4d 02 00 00       	jmp    103051 <vprintfmt+0x3e7>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102e04:	8b 45 14             	mov    0x14(%ebp),%eax
  102e07:	8d 50 04             	lea    0x4(%eax),%edx
  102e0a:	89 55 14             	mov    %edx,0x14(%ebp)
  102e0d:	8b 30                	mov    (%eax),%esi
  102e0f:	85 f6                	test   %esi,%esi
  102e11:	75 05                	jne    102e18 <vprintfmt+0x1ae>
                p = "(null)";
  102e13:	be cd 3d 10 00       	mov    $0x103dcd,%esi
            }
            if (width > 0 && padc != '-') {
  102e18:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e1c:	7e 7c                	jle    102e9a <vprintfmt+0x230>
  102e1e:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102e22:	74 76                	je     102e9a <vprintfmt+0x230>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e24:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102e27:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e2e:	89 34 24             	mov    %esi,(%esp)
  102e31:	e8 21 03 00 00       	call   103157 <strnlen>
  102e36:	89 da                	mov    %ebx,%edx
  102e38:	29 c2                	sub    %eax,%edx
  102e3a:	89 d0                	mov    %edx,%eax
  102e3c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102e3f:	eb 17                	jmp    102e58 <vprintfmt+0x1ee>
                    putch(padc, putdat);
  102e41:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102e45:	8b 55 0c             	mov    0xc(%ebp),%edx
  102e48:	89 54 24 04          	mov    %edx,0x4(%esp)
  102e4c:	89 04 24             	mov    %eax,(%esp)
  102e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e52:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102e54:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102e58:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102e5c:	7f e3                	jg     102e41 <vprintfmt+0x1d7>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102e5e:	eb 3a                	jmp    102e9a <vprintfmt+0x230>
                if (altflag && (ch < ' ' || ch > '~')) {
  102e60:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102e64:	74 1f                	je     102e85 <vprintfmt+0x21b>
  102e66:	83 fb 1f             	cmp    $0x1f,%ebx
  102e69:	7e 05                	jle    102e70 <vprintfmt+0x206>
  102e6b:	83 fb 7e             	cmp    $0x7e,%ebx
  102e6e:	7e 15                	jle    102e85 <vprintfmt+0x21b>
                    putch('?', putdat);
  102e70:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e73:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e77:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102e7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e81:	ff d0                	call   *%eax
  102e83:	eb 0f                	jmp    102e94 <vprintfmt+0x22a>
                }
                else {
                    putch(ch, putdat);
  102e85:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e88:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e8c:	89 1c 24             	mov    %ebx,(%esp)
  102e8f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e92:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102e94:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102e98:	eb 01                	jmp    102e9b <vprintfmt+0x231>
  102e9a:	90                   	nop
  102e9b:	0f b6 06             	movzbl (%esi),%eax
  102e9e:	0f be d8             	movsbl %al,%ebx
  102ea1:	85 db                	test   %ebx,%ebx
  102ea3:	0f 95 c0             	setne  %al
  102ea6:	83 c6 01             	add    $0x1,%esi
  102ea9:	84 c0                	test   %al,%al
  102eab:	74 29                	je     102ed6 <vprintfmt+0x26c>
  102ead:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102eb1:	78 ad                	js     102e60 <vprintfmt+0x1f6>
  102eb3:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102eb7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102ebb:	79 a3                	jns    102e60 <vprintfmt+0x1f6>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102ebd:	eb 17                	jmp    102ed6 <vprintfmt+0x26c>
                putch(' ', putdat);
  102ebf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ec6:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102ecd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed0:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102ed2:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102ed6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102eda:	7f e3                	jg     102ebf <vprintfmt+0x255>
                putch(' ', putdat);
            }
            break;
  102edc:	e9 70 01 00 00       	jmp    103051 <vprintfmt+0x3e7>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102ee1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ee4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ee8:	8d 45 14             	lea    0x14(%ebp),%eax
  102eeb:	89 04 24             	mov    %eax,(%esp)
  102eee:	e8 f8 fc ff ff       	call   102beb <getint>
  102ef3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ef6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102ef9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102efc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eff:	85 d2                	test   %edx,%edx
  102f01:	79 26                	jns    102f29 <vprintfmt+0x2bf>
                putch('-', putdat);
  102f03:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f06:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f0a:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102f11:	8b 45 08             	mov    0x8(%ebp),%eax
  102f14:	ff d0                	call   *%eax
                num = -(long long)num;
  102f16:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f19:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f1c:	f7 d8                	neg    %eax
  102f1e:	83 d2 00             	adc    $0x0,%edx
  102f21:	f7 da                	neg    %edx
  102f23:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f26:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102f29:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f30:	e9 a8 00 00 00       	jmp    102fdd <vprintfmt+0x373>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102f35:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f38:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f3c:	8d 45 14             	lea    0x14(%ebp),%eax
  102f3f:	89 04 24             	mov    %eax,(%esp)
  102f42:	e8 55 fc ff ff       	call   102b9c <getuint>
  102f47:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f4a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102f4d:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102f54:	e9 84 00 00 00       	jmp    102fdd <vprintfmt+0x373>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102f59:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102f5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f60:	8d 45 14             	lea    0x14(%ebp),%eax
  102f63:	89 04 24             	mov    %eax,(%esp)
  102f66:	e8 31 fc ff ff       	call   102b9c <getuint>
  102f6b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f6e:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102f71:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102f78:	eb 63                	jmp    102fdd <vprintfmt+0x373>

        // pointer
        case 'p':
            putch('0', putdat);
  102f7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f7d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f81:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102f88:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8b:	ff d0                	call   *%eax
            putch('x', putdat);
  102f8d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f90:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f94:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102f9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f9e:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102fa0:	8b 45 14             	mov    0x14(%ebp),%eax
  102fa3:	8d 50 04             	lea    0x4(%eax),%edx
  102fa6:	89 55 14             	mov    %edx,0x14(%ebp)
  102fa9:	8b 00                	mov    (%eax),%eax
  102fab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102fb5:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102fbc:	eb 1f                	jmp    102fdd <vprintfmt+0x373>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102fbe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fc1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fc5:	8d 45 14             	lea    0x14(%ebp),%eax
  102fc8:	89 04 24             	mov    %eax,(%esp)
  102fcb:	e8 cc fb ff ff       	call   102b9c <getuint>
  102fd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fd3:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102fd6:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102fdd:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102fe1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fe4:	89 54 24 18          	mov    %edx,0x18(%esp)
  102fe8:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102feb:	89 54 24 14          	mov    %edx,0x14(%esp)
  102fef:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ff3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ff6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ff9:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ffd:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103001:	8b 45 0c             	mov    0xc(%ebp),%eax
  103004:	89 44 24 04          	mov    %eax,0x4(%esp)
  103008:	8b 45 08             	mov    0x8(%ebp),%eax
  10300b:	89 04 24             	mov    %eax,(%esp)
  10300e:	e8 51 fa ff ff       	call   102a64 <printnum>
            break;
  103013:	eb 3c                	jmp    103051 <vprintfmt+0x3e7>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103015:	8b 45 0c             	mov    0xc(%ebp),%eax
  103018:	89 44 24 04          	mov    %eax,0x4(%esp)
  10301c:	89 1c 24             	mov    %ebx,(%esp)
  10301f:	8b 45 08             	mov    0x8(%ebp),%eax
  103022:	ff d0                	call   *%eax
            break;
  103024:	eb 2b                	jmp    103051 <vprintfmt+0x3e7>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103026:	8b 45 0c             	mov    0xc(%ebp),%eax
  103029:	89 44 24 04          	mov    %eax,0x4(%esp)
  10302d:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103034:	8b 45 08             	mov    0x8(%ebp),%eax
  103037:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103039:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10303d:	eb 04                	jmp    103043 <vprintfmt+0x3d9>
  10303f:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103043:	8b 45 10             	mov    0x10(%ebp),%eax
  103046:	83 e8 01             	sub    $0x1,%eax
  103049:	0f b6 00             	movzbl (%eax),%eax
  10304c:	3c 25                	cmp    $0x25,%al
  10304e:	75 ef                	jne    10303f <vprintfmt+0x3d5>
                /* do nothing */;
            break;
  103050:	90                   	nop
        }
    }
  103051:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103052:	e9 34 fc ff ff       	jmp    102c8b <vprintfmt+0x21>
            if (ch == '\0') {
                return;
  103057:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  103058:	83 c4 40             	add    $0x40,%esp
  10305b:	5b                   	pop    %ebx
  10305c:	5e                   	pop    %esi
  10305d:	5d                   	pop    %ebp
  10305e:	c3                   	ret    

0010305f <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  10305f:	55                   	push   %ebp
  103060:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103062:	8b 45 0c             	mov    0xc(%ebp),%eax
  103065:	8b 40 08             	mov    0x8(%eax),%eax
  103068:	8d 50 01             	lea    0x1(%eax),%edx
  10306b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10306e:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103071:	8b 45 0c             	mov    0xc(%ebp),%eax
  103074:	8b 10                	mov    (%eax),%edx
  103076:	8b 45 0c             	mov    0xc(%ebp),%eax
  103079:	8b 40 04             	mov    0x4(%eax),%eax
  10307c:	39 c2                	cmp    %eax,%edx
  10307e:	73 12                	jae    103092 <sprintputch+0x33>
        *b->buf ++ = ch;
  103080:	8b 45 0c             	mov    0xc(%ebp),%eax
  103083:	8b 00                	mov    (%eax),%eax
  103085:	8b 55 08             	mov    0x8(%ebp),%edx
  103088:	88 10                	mov    %dl,(%eax)
  10308a:	8d 50 01             	lea    0x1(%eax),%edx
  10308d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103090:	89 10                	mov    %edx,(%eax)
    }
}
  103092:	5d                   	pop    %ebp
  103093:	c3                   	ret    

00103094 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103094:	55                   	push   %ebp
  103095:	89 e5                	mov    %esp,%ebp
  103097:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10309a:	8d 55 14             	lea    0x14(%ebp),%edx
  10309d:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1030a0:	89 10                	mov    %edx,(%eax)
    cnt = vsnprintf(str, size, fmt, ap);
  1030a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030a5:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1030a9:	8b 45 10             	mov    0x10(%ebp),%eax
  1030ac:	89 44 24 08          	mov    %eax,0x8(%esp)
  1030b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ba:	89 04 24             	mov    %eax,(%esp)
  1030bd:	e8 08 00 00 00       	call   1030ca <vsnprintf>
  1030c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1030c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1030c8:	c9                   	leave  
  1030c9:	c3                   	ret    

001030ca <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1030ca:	55                   	push   %ebp
  1030cb:	89 e5                	mov    %esp,%ebp
  1030cd:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1030d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030d9:	83 e8 01             	sub    $0x1,%eax
  1030dc:	03 45 08             	add    0x8(%ebp),%eax
  1030df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1030e9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1030ed:	74 0a                	je     1030f9 <vsnprintf+0x2f>
  1030ef:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1030f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030f5:	39 c2                	cmp    %eax,%edx
  1030f7:	76 07                	jbe    103100 <vsnprintf+0x36>
        return -E_INVAL;
  1030f9:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1030fe:	eb 2a                	jmp    10312a <vsnprintf+0x60>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103100:	8b 45 14             	mov    0x14(%ebp),%eax
  103103:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103107:	8b 45 10             	mov    0x10(%ebp),%eax
  10310a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10310e:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103111:	89 44 24 04          	mov    %eax,0x4(%esp)
  103115:	c7 04 24 5f 30 10 00 	movl   $0x10305f,(%esp)
  10311c:	e8 49 fb ff ff       	call   102c6a <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103121:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103124:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  103127:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10312a:	c9                   	leave  
  10312b:	c3                   	ret    

0010312c <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  10312c:	55                   	push   %ebp
  10312d:	89 e5                	mov    %esp,%ebp
  10312f:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  103132:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  103139:	eb 04                	jmp    10313f <strlen+0x13>
        cnt ++;
  10313b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  10313f:	8b 45 08             	mov    0x8(%ebp),%eax
  103142:	0f b6 00             	movzbl (%eax),%eax
  103145:	84 c0                	test   %al,%al
  103147:	0f 95 c0             	setne  %al
  10314a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10314e:	84 c0                	test   %al,%al
  103150:	75 e9                	jne    10313b <strlen+0xf>
        cnt ++;
    }
    return cnt;
  103152:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103155:	c9                   	leave  
  103156:	c3                   	ret    

00103157 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  103157:	55                   	push   %ebp
  103158:	89 e5                	mov    %esp,%ebp
  10315a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  10315d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  103164:	eb 04                	jmp    10316a <strnlen+0x13>
        cnt ++;
  103166:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  10316a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10316d:	3b 45 0c             	cmp    0xc(%ebp),%eax
  103170:	73 13                	jae    103185 <strnlen+0x2e>
  103172:	8b 45 08             	mov    0x8(%ebp),%eax
  103175:	0f b6 00             	movzbl (%eax),%eax
  103178:	84 c0                	test   %al,%al
  10317a:	0f 95 c0             	setne  %al
  10317d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103181:	84 c0                	test   %al,%al
  103183:	75 e1                	jne    103166 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  103185:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  103188:	c9                   	leave  
  103189:	c3                   	ret    

0010318a <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  10318a:	55                   	push   %ebp
  10318b:	89 e5                	mov    %esp,%ebp
  10318d:	57                   	push   %edi
  10318e:	56                   	push   %esi
  10318f:	53                   	push   %ebx
  103190:	83 ec 24             	sub    $0x24,%esp
  103193:	8b 45 08             	mov    0x8(%ebp),%eax
  103196:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103199:	8b 45 0c             	mov    0xc(%ebp),%eax
  10319c:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10319f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1031a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031a5:	89 d6                	mov    %edx,%esi
  1031a7:	89 c3                	mov    %eax,%ebx
  1031a9:	89 df                	mov    %ebx,%edi
  1031ab:	ac                   	lods   %ds:(%esi),%al
  1031ac:	aa                   	stos   %al,%es:(%edi)
  1031ad:	84 c0                	test   %al,%al
  1031af:	75 fa                	jne    1031ab <strcpy+0x21>
  1031b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1031b4:	89 fb                	mov    %edi,%ebx
  1031b6:	89 75 e8             	mov    %esi,-0x18(%ebp)
  1031b9:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  1031bc:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1031bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  1031c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  1031c5:	83 c4 24             	add    $0x24,%esp
  1031c8:	5b                   	pop    %ebx
  1031c9:	5e                   	pop    %esi
  1031ca:	5f                   	pop    %edi
  1031cb:	5d                   	pop    %ebp
  1031cc:	c3                   	ret    

001031cd <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  1031cd:	55                   	push   %ebp
  1031ce:	89 e5                	mov    %esp,%ebp
  1031d0:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  1031d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  1031d9:	eb 21                	jmp    1031fc <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  1031db:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031de:	0f b6 10             	movzbl (%eax),%edx
  1031e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031e4:	88 10                	mov    %dl,(%eax)
  1031e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031e9:	0f b6 00             	movzbl (%eax),%eax
  1031ec:	84 c0                	test   %al,%al
  1031ee:	74 04                	je     1031f4 <strncpy+0x27>
            src ++;
  1031f0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  1031f4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1031f8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  1031fc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103200:	75 d9                	jne    1031db <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  103202:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103205:	c9                   	leave  
  103206:	c3                   	ret    

00103207 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103207:	55                   	push   %ebp
  103208:	89 e5                	mov    %esp,%ebp
  10320a:	57                   	push   %edi
  10320b:	56                   	push   %esi
  10320c:	53                   	push   %ebx
  10320d:	83 ec 24             	sub    $0x24,%esp
  103210:	8b 45 08             	mov    0x8(%ebp),%eax
  103213:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103216:	8b 45 0c             	mov    0xc(%ebp),%eax
  103219:	89 45 ec             	mov    %eax,-0x14(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  10321c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10321f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103222:	89 d6                	mov    %edx,%esi
  103224:	89 c3                	mov    %eax,%ebx
  103226:	89 df                	mov    %ebx,%edi
  103228:	ac                   	lods   %ds:(%esi),%al
  103229:	ae                   	scas   %es:(%edi),%al
  10322a:	75 08                	jne    103234 <strcmp+0x2d>
  10322c:	84 c0                	test   %al,%al
  10322e:	75 f8                	jne    103228 <strcmp+0x21>
  103230:	31 c0                	xor    %eax,%eax
  103232:	eb 04                	jmp    103238 <strcmp+0x31>
  103234:	19 c0                	sbb    %eax,%eax
  103236:	0c 01                	or     $0x1,%al
  103238:	89 fb                	mov    %edi,%ebx
  10323a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10323d:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103240:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103243:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  103246:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103249:	8b 45 e8             	mov    -0x18(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  10324c:	83 c4 24             	add    $0x24,%esp
  10324f:	5b                   	pop    %ebx
  103250:	5e                   	pop    %esi
  103251:	5f                   	pop    %edi
  103252:	5d                   	pop    %ebp
  103253:	c3                   	ret    

00103254 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103254:	55                   	push   %ebp
  103255:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103257:	eb 0c                	jmp    103265 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103259:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  10325d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103261:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103265:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103269:	74 1a                	je     103285 <strncmp+0x31>
  10326b:	8b 45 08             	mov    0x8(%ebp),%eax
  10326e:	0f b6 00             	movzbl (%eax),%eax
  103271:	84 c0                	test   %al,%al
  103273:	74 10                	je     103285 <strncmp+0x31>
  103275:	8b 45 08             	mov    0x8(%ebp),%eax
  103278:	0f b6 10             	movzbl (%eax),%edx
  10327b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10327e:	0f b6 00             	movzbl (%eax),%eax
  103281:	38 c2                	cmp    %al,%dl
  103283:	74 d4                	je     103259 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103285:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103289:	74 1a                	je     1032a5 <strncmp+0x51>
  10328b:	8b 45 08             	mov    0x8(%ebp),%eax
  10328e:	0f b6 00             	movzbl (%eax),%eax
  103291:	0f b6 d0             	movzbl %al,%edx
  103294:	8b 45 0c             	mov    0xc(%ebp),%eax
  103297:	0f b6 00             	movzbl (%eax),%eax
  10329a:	0f b6 c0             	movzbl %al,%eax
  10329d:	89 d1                	mov    %edx,%ecx
  10329f:	29 c1                	sub    %eax,%ecx
  1032a1:	89 c8                	mov    %ecx,%eax
  1032a3:	eb 05                	jmp    1032aa <strncmp+0x56>
  1032a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032aa:	5d                   	pop    %ebp
  1032ab:	c3                   	ret    

001032ac <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1032ac:	55                   	push   %ebp
  1032ad:	89 e5                	mov    %esp,%ebp
  1032af:	83 ec 04             	sub    $0x4,%esp
  1032b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b5:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1032b8:	eb 14                	jmp    1032ce <strchr+0x22>
        if (*s == c) {
  1032ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1032bd:	0f b6 00             	movzbl (%eax),%eax
  1032c0:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1032c3:	75 05                	jne    1032ca <strchr+0x1e>
            return (char *)s;
  1032c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c8:	eb 13                	jmp    1032dd <strchr+0x31>
        }
        s ++;
  1032ca:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1032ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1032d1:	0f b6 00             	movzbl (%eax),%eax
  1032d4:	84 c0                	test   %al,%al
  1032d6:	75 e2                	jne    1032ba <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1032d8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032dd:	c9                   	leave  
  1032de:	c3                   	ret    

001032df <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1032df:	55                   	push   %ebp
  1032e0:	89 e5                	mov    %esp,%ebp
  1032e2:	83 ec 04             	sub    $0x4,%esp
  1032e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e8:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1032eb:	eb 0f                	jmp    1032fc <strfind+0x1d>
        if (*s == c) {
  1032ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1032f0:	0f b6 00             	movzbl (%eax),%eax
  1032f3:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1032f6:	74 10                	je     103308 <strfind+0x29>
            break;
        }
        s ++;
  1032f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  1032fc:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ff:	0f b6 00             	movzbl (%eax),%eax
  103302:	84 c0                	test   %al,%al
  103304:	75 e7                	jne    1032ed <strfind+0xe>
  103306:	eb 01                	jmp    103309 <strfind+0x2a>
        if (*s == c) {
            break;
  103308:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  103309:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10330c:	c9                   	leave  
  10330d:	c3                   	ret    

0010330e <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  10330e:	55                   	push   %ebp
  10330f:	89 e5                	mov    %esp,%ebp
  103311:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103314:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10331b:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103322:	eb 04                	jmp    103328 <strtol+0x1a>
        s ++;
  103324:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103328:	8b 45 08             	mov    0x8(%ebp),%eax
  10332b:	0f b6 00             	movzbl (%eax),%eax
  10332e:	3c 20                	cmp    $0x20,%al
  103330:	74 f2                	je     103324 <strtol+0x16>
  103332:	8b 45 08             	mov    0x8(%ebp),%eax
  103335:	0f b6 00             	movzbl (%eax),%eax
  103338:	3c 09                	cmp    $0x9,%al
  10333a:	74 e8                	je     103324 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  10333c:	8b 45 08             	mov    0x8(%ebp),%eax
  10333f:	0f b6 00             	movzbl (%eax),%eax
  103342:	3c 2b                	cmp    $0x2b,%al
  103344:	75 06                	jne    10334c <strtol+0x3e>
        s ++;
  103346:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10334a:	eb 15                	jmp    103361 <strtol+0x53>
    }
    else if (*s == '-') {
  10334c:	8b 45 08             	mov    0x8(%ebp),%eax
  10334f:	0f b6 00             	movzbl (%eax),%eax
  103352:	3c 2d                	cmp    $0x2d,%al
  103354:	75 0b                	jne    103361 <strtol+0x53>
        s ++, neg = 1;
  103356:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10335a:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  103361:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103365:	74 06                	je     10336d <strtol+0x5f>
  103367:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  10336b:	75 24                	jne    103391 <strtol+0x83>
  10336d:	8b 45 08             	mov    0x8(%ebp),%eax
  103370:	0f b6 00             	movzbl (%eax),%eax
  103373:	3c 30                	cmp    $0x30,%al
  103375:	75 1a                	jne    103391 <strtol+0x83>
  103377:	8b 45 08             	mov    0x8(%ebp),%eax
  10337a:	83 c0 01             	add    $0x1,%eax
  10337d:	0f b6 00             	movzbl (%eax),%eax
  103380:	3c 78                	cmp    $0x78,%al
  103382:	75 0d                	jne    103391 <strtol+0x83>
        s += 2, base = 16;
  103384:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103388:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10338f:	eb 2a                	jmp    1033bb <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  103391:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103395:	75 17                	jne    1033ae <strtol+0xa0>
  103397:	8b 45 08             	mov    0x8(%ebp),%eax
  10339a:	0f b6 00             	movzbl (%eax),%eax
  10339d:	3c 30                	cmp    $0x30,%al
  10339f:	75 0d                	jne    1033ae <strtol+0xa0>
        s ++, base = 8;
  1033a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1033a5:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1033ac:	eb 0d                	jmp    1033bb <strtol+0xad>
    }
    else if (base == 0) {
  1033ae:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1033b2:	75 07                	jne    1033bb <strtol+0xad>
        base = 10;
  1033b4:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1033bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1033be:	0f b6 00             	movzbl (%eax),%eax
  1033c1:	3c 2f                	cmp    $0x2f,%al
  1033c3:	7e 1b                	jle    1033e0 <strtol+0xd2>
  1033c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1033c8:	0f b6 00             	movzbl (%eax),%eax
  1033cb:	3c 39                	cmp    $0x39,%al
  1033cd:	7f 11                	jg     1033e0 <strtol+0xd2>
            dig = *s - '0';
  1033cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1033d2:	0f b6 00             	movzbl (%eax),%eax
  1033d5:	0f be c0             	movsbl %al,%eax
  1033d8:	83 e8 30             	sub    $0x30,%eax
  1033db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033de:	eb 48                	jmp    103428 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1033e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1033e3:	0f b6 00             	movzbl (%eax),%eax
  1033e6:	3c 60                	cmp    $0x60,%al
  1033e8:	7e 1b                	jle    103405 <strtol+0xf7>
  1033ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1033ed:	0f b6 00             	movzbl (%eax),%eax
  1033f0:	3c 7a                	cmp    $0x7a,%al
  1033f2:	7f 11                	jg     103405 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1033f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1033f7:	0f b6 00             	movzbl (%eax),%eax
  1033fa:	0f be c0             	movsbl %al,%eax
  1033fd:	83 e8 57             	sub    $0x57,%eax
  103400:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103403:	eb 23                	jmp    103428 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103405:	8b 45 08             	mov    0x8(%ebp),%eax
  103408:	0f b6 00             	movzbl (%eax),%eax
  10340b:	3c 40                	cmp    $0x40,%al
  10340d:	7e 38                	jle    103447 <strtol+0x139>
  10340f:	8b 45 08             	mov    0x8(%ebp),%eax
  103412:	0f b6 00             	movzbl (%eax),%eax
  103415:	3c 5a                	cmp    $0x5a,%al
  103417:	7f 2e                	jg     103447 <strtol+0x139>
            dig = *s - 'A' + 10;
  103419:	8b 45 08             	mov    0x8(%ebp),%eax
  10341c:	0f b6 00             	movzbl (%eax),%eax
  10341f:	0f be c0             	movsbl %al,%eax
  103422:	83 e8 37             	sub    $0x37,%eax
  103425:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103428:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10342b:	3b 45 10             	cmp    0x10(%ebp),%eax
  10342e:	7d 16                	jge    103446 <strtol+0x138>
            break;
        }
        s ++, val = (val * base) + dig;
  103430:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103434:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103437:	0f af 45 10          	imul   0x10(%ebp),%eax
  10343b:	03 45 f4             	add    -0xc(%ebp),%eax
  10343e:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103441:	e9 75 ff ff ff       	jmp    1033bb <strtol+0xad>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  103446:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  103447:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10344b:	74 08                	je     103455 <strtol+0x147>
        *endptr = (char *) s;
  10344d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103450:	8b 55 08             	mov    0x8(%ebp),%edx
  103453:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103455:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103459:	74 07                	je     103462 <strtol+0x154>
  10345b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10345e:	f7 d8                	neg    %eax
  103460:	eb 03                	jmp    103465 <strtol+0x157>
  103462:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103465:	c9                   	leave  
  103466:	c3                   	ret    

00103467 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103467:	55                   	push   %ebp
  103468:	89 e5                	mov    %esp,%ebp
  10346a:	57                   	push   %edi
  10346b:	56                   	push   %esi
  10346c:	53                   	push   %ebx
  10346d:	83 ec 24             	sub    $0x24,%esp
  103470:	8b 45 0c             	mov    0xc(%ebp),%eax
  103473:	88 45 d0             	mov    %al,-0x30(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103476:	0f be 45 d0          	movsbl -0x30(%ebp),%eax
  10347a:	8b 55 08             	mov    0x8(%ebp),%edx
  10347d:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103480:	88 45 ef             	mov    %al,-0x11(%ebp)
  103483:	8b 45 10             	mov    0x10(%ebp),%eax
  103486:	89 45 e8             	mov    %eax,-0x18(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103489:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10348c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  103490:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103493:	89 ce                	mov    %ecx,%esi
  103495:	89 d3                	mov    %edx,%ebx
  103497:	89 f1                	mov    %esi,%ecx
  103499:	89 df                	mov    %ebx,%edi
  10349b:	f3 aa                	rep stos %al,%es:(%edi)
  10349d:	89 fb                	mov    %edi,%ebx
  10349f:	89 ce                	mov    %ecx,%esi
  1034a1:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  1034a4:	89 5d e0             	mov    %ebx,-0x20(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1034a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1034aa:	83 c4 24             	add    $0x24,%esp
  1034ad:	5b                   	pop    %ebx
  1034ae:	5e                   	pop    %esi
  1034af:	5f                   	pop    %edi
  1034b0:	5d                   	pop    %ebp
  1034b1:	c3                   	ret    

001034b2 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1034b2:	55                   	push   %ebp
  1034b3:	89 e5                	mov    %esp,%ebp
  1034b5:	57                   	push   %edi
  1034b6:	56                   	push   %esi
  1034b7:	53                   	push   %ebx
  1034b8:	83 ec 38             	sub    $0x38,%esp
  1034bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034c1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1034c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1034ca:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1034cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034d0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1034d3:	73 4e                	jae    103523 <memmove+0x71>
  1034d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1034db:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034de:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1034e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1034e4:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1034e7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1034ea:	89 c1                	mov    %eax,%ecx
  1034ec:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1034ef:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1034f2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1034f5:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  1034f8:	89 d7                	mov    %edx,%edi
  1034fa:	89 c3                	mov    %eax,%ebx
  1034fc:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  1034ff:	89 de                	mov    %ebx,%esi
  103501:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103503:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103506:	83 e1 03             	and    $0x3,%ecx
  103509:	74 02                	je     10350d <memmove+0x5b>
  10350b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10350d:	89 f3                	mov    %esi,%ebx
  10350f:	89 4d c0             	mov    %ecx,-0x40(%ebp)
  103512:	8b 4d c0             	mov    -0x40(%ebp),%ecx
  103515:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103518:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  10351b:	89 5d d0             	mov    %ebx,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10351e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103521:	eb 3b                	jmp    10355e <memmove+0xac>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103523:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103526:	83 e8 01             	sub    $0x1,%eax
  103529:	89 c2                	mov    %eax,%edx
  10352b:	03 55 ec             	add    -0x14(%ebp),%edx
  10352e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103531:	83 e8 01             	sub    $0x1,%eax
  103534:	03 45 f0             	add    -0x10(%ebp),%eax
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103537:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10353a:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  10353d:	89 d6                	mov    %edx,%esi
  10353f:	89 c3                	mov    %eax,%ebx
  103541:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  103544:	89 df                	mov    %ebx,%edi
  103546:	fd                   	std    
  103547:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103549:	fc                   	cld    
  10354a:	89 fb                	mov    %edi,%ebx
  10354c:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  10354f:	8b 4d bc             	mov    -0x44(%ebp),%ecx
  103552:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103555:	89 75 c8             	mov    %esi,-0x38(%ebp)
  103558:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10355b:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  10355e:	83 c4 38             	add    $0x38,%esp
  103561:	5b                   	pop    %ebx
  103562:	5e                   	pop    %esi
  103563:	5f                   	pop    %edi
  103564:	5d                   	pop    %ebp
  103565:	c3                   	ret    

00103566 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103566:	55                   	push   %ebp
  103567:	89 e5                	mov    %esp,%ebp
  103569:	57                   	push   %edi
  10356a:	56                   	push   %esi
  10356b:	53                   	push   %ebx
  10356c:	83 ec 24             	sub    $0x24,%esp
  10356f:	8b 45 08             	mov    0x8(%ebp),%eax
  103572:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103575:	8b 45 0c             	mov    0xc(%ebp),%eax
  103578:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10357b:	8b 45 10             	mov    0x10(%ebp),%eax
  10357e:	89 45 e8             	mov    %eax,-0x18(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103581:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103584:	89 c1                	mov    %eax,%ecx
  103586:	c1 e9 02             	shr    $0x2,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103589:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10358c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10358f:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  103592:	89 d7                	mov    %edx,%edi
  103594:	89 c3                	mov    %eax,%ebx
  103596:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  103599:	89 de                	mov    %ebx,%esi
  10359b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10359d:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1035a0:	83 e1 03             	and    $0x3,%ecx
  1035a3:	74 02                	je     1035a7 <memcpy+0x41>
  1035a5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1035a7:	89 f3                	mov    %esi,%ebx
  1035a9:	89 4d d0             	mov    %ecx,-0x30(%ebp)
  1035ac:	8b 4d d0             	mov    -0x30(%ebp),%ecx
  1035af:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  1035b2:	89 7d e0             	mov    %edi,-0x20(%ebp)
  1035b5:	89 5d dc             	mov    %ebx,-0x24(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1035b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1035bb:	83 c4 24             	add    $0x24,%esp
  1035be:	5b                   	pop    %ebx
  1035bf:	5e                   	pop    %esi
  1035c0:	5f                   	pop    %edi
  1035c1:	5d                   	pop    %ebp
  1035c2:	c3                   	ret    

001035c3 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1035c3:	55                   	push   %ebp
  1035c4:	89 e5                	mov    %esp,%ebp
  1035c6:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1035c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1035cc:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1035cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035d2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1035d5:	eb 32                	jmp    103609 <memcmp+0x46>
        if (*s1 != *s2) {
  1035d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1035da:	0f b6 10             	movzbl (%eax),%edx
  1035dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1035e0:	0f b6 00             	movzbl (%eax),%eax
  1035e3:	38 c2                	cmp    %al,%dl
  1035e5:	74 1a                	je     103601 <memcmp+0x3e>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1035e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1035ea:	0f b6 00             	movzbl (%eax),%eax
  1035ed:	0f b6 d0             	movzbl %al,%edx
  1035f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1035f3:	0f b6 00             	movzbl (%eax),%eax
  1035f6:	0f b6 c0             	movzbl %al,%eax
  1035f9:	89 d1                	mov    %edx,%ecx
  1035fb:	29 c1                	sub    %eax,%ecx
  1035fd:	89 c8                	mov    %ecx,%eax
  1035ff:	eb 1c                	jmp    10361d <memcmp+0x5a>
        }
        s1 ++, s2 ++;
  103601:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103605:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  103609:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10360d:	0f 95 c0             	setne  %al
  103610:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103614:	84 c0                	test   %al,%al
  103616:	75 bf                	jne    1035d7 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103618:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10361d:	c9                   	leave  
  10361e:	c3                   	ret    
