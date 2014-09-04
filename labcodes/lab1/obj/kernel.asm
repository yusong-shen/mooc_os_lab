
bin/kernel：     文件格式 elf32-i386


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
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 7a 30 00 00       	call   1030a6 <memset>

    cons_init();                // init the console
  10002c:	e8 7a 14 00 00       	call   1014ab <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 40 32 10 00 	movl   $0x103240,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 5c 32 10 00 	movl   $0x10325c,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 92 26 00 00       	call   1026ec <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 8f 15 00 00       	call   1015ee <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 07 17 00 00       	call   10176b <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 35 0c 00 00       	call   100c9e <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 ee 14 00 00       	call   10155c <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 3e 0b 00 00       	call   100bd0 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 61 32 10 00 	movl   $0x103261,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 6f 32 10 00 	movl   $0x10326f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 7d 32 10 00 	movl   $0x10327d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 8b 32 10 00 	movl   $0x10328b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 99 32 10 00 	movl   $0x103299,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 a8 32 10 00 	movl   $0x1032a8,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 c8 32 10 00 	movl   $0x1032c8,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 e7 32 10 00 	movl   $0x1032e7,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 07 12 00 00       	call   1014d7 <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 b2 25 00 00       	call   1028bf <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 8e 11 00 00       	call   1014d7 <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 5b 11 00 00       	call   101500 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 ec 32 10 00    	movl   $0x1032ec,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 ec 32 10 00 	movl   $0x1032ec,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 2c 3b 10 00 	movl   $0x103b2c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 5c b0 10 00 	movl   $0x10b05c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 5d b0 10 00 	movl   $0x10b05d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 2b d0 10 00 	movl   $0x10d02b,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 58 28 00 00       	call   102f1a <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 f6 32 10 00 	movl   $0x1032f6,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 0f 33 10 00 	movl   $0x10330f,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 2f 32 10 	movl   $0x10322f,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 27 33 10 00 	movl   $0x103327,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 3f 33 10 00 	movl   $0x10333f,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 57 33 10 00 	movl   $0x103357,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 70 33 10 00 	movl   $0x103370,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 9a 33 10 00 	movl   $0x10339a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 b6 33 10 00 	movl   $0x1033b6,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
}
  100993:	5d                   	pop    %ebp
  100994:	c3                   	ret    

00100995 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100995:	55                   	push   %ebp
  100996:	89 e5                	mov    %esp,%ebp
  100998:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  10099b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  1009a2:	eb 0c                	jmp    1009b0 <parse+0x1b>
            *buf ++ = '\0';
  1009a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1009a7:	8d 50 01             	lea    0x1(%eax),%edx
  1009aa:	89 55 08             	mov    %edx,0x8(%ebp)
  1009ad:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  1009b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1009b3:	0f b6 00             	movzbl (%eax),%eax
  1009b6:	84 c0                	test   %al,%al
  1009b8:	74 1d                	je     1009d7 <parse+0x42>
  1009ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bd:	0f b6 00             	movzbl (%eax),%eax
  1009c0:	0f be c0             	movsbl %al,%eax
  1009c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c7:	c7 04 24 48 34 10 00 	movl   $0x103448,(%esp)
  1009ce:	e8 14 25 00 00       	call   102ee7 <strchr>
  1009d3:	85 c0                	test   %eax,%eax
  1009d5:	75 cd                	jne    1009a4 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  1009d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1009da:	0f b6 00             	movzbl (%eax),%eax
  1009dd:	84 c0                	test   %al,%al
  1009df:	75 02                	jne    1009e3 <parse+0x4e>
            break;
  1009e1:	eb 67                	jmp    100a4a <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  1009e3:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  1009e7:	75 14                	jne    1009fd <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  1009e9:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  1009f0:	00 
  1009f1:	c7 04 24 4d 34 10 00 	movl   $0x10344d,(%esp)
  1009f8:	e8 15 f9 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  1009fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a00:	8d 50 01             	lea    0x1(%eax),%edx
  100a03:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100a06:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100a0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100a10:	01 c2                	add    %eax,%edx
  100a12:	8b 45 08             	mov    0x8(%ebp),%eax
  100a15:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a17:	eb 04                	jmp    100a1d <parse+0x88>
            buf ++;
  100a19:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100a1d:	8b 45 08             	mov    0x8(%ebp),%eax
  100a20:	0f b6 00             	movzbl (%eax),%eax
  100a23:	84 c0                	test   %al,%al
  100a25:	74 1d                	je     100a44 <parse+0xaf>
  100a27:	8b 45 08             	mov    0x8(%ebp),%eax
  100a2a:	0f b6 00             	movzbl (%eax),%eax
  100a2d:	0f be c0             	movsbl %al,%eax
  100a30:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a34:	c7 04 24 48 34 10 00 	movl   $0x103448,(%esp)
  100a3b:	e8 a7 24 00 00       	call   102ee7 <strchr>
  100a40:	85 c0                	test   %eax,%eax
  100a42:	74 d5                	je     100a19 <parse+0x84>
            buf ++;
        }
    }
  100a44:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a45:	e9 66 ff ff ff       	jmp    1009b0 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100a4d:	c9                   	leave  
  100a4e:	c3                   	ret    

00100a4f <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100a4f:	55                   	push   %ebp
  100a50:	89 e5                	mov    %esp,%ebp
  100a52:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100a55:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100a58:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a5c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5f:	89 04 24             	mov    %eax,(%esp)
  100a62:	e8 2e ff ff ff       	call   100995 <parse>
  100a67:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100a6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a6e:	75 0a                	jne    100a7a <runcmd+0x2b>
        return 0;
  100a70:	b8 00 00 00 00       	mov    $0x0,%eax
  100a75:	e9 85 00 00 00       	jmp    100aff <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100a7a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a81:	eb 5c                	jmp    100adf <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100a83:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100a86:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100a89:	89 d0                	mov    %edx,%eax
  100a8b:	01 c0                	add    %eax,%eax
  100a8d:	01 d0                	add    %edx,%eax
  100a8f:	c1 e0 02             	shl    $0x2,%eax
  100a92:	05 00 e0 10 00       	add    $0x10e000,%eax
  100a97:	8b 00                	mov    (%eax),%eax
  100a99:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100a9d:	89 04 24             	mov    %eax,(%esp)
  100aa0:	e8 a3 23 00 00       	call   102e48 <strcmp>
  100aa5:	85 c0                	test   %eax,%eax
  100aa7:	75 32                	jne    100adb <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100aa9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100aac:	89 d0                	mov    %edx,%eax
  100aae:	01 c0                	add    %eax,%eax
  100ab0:	01 d0                	add    %edx,%eax
  100ab2:	c1 e0 02             	shl    $0x2,%eax
  100ab5:	05 00 e0 10 00       	add    $0x10e000,%eax
  100aba:	8b 40 08             	mov    0x8(%eax),%eax
  100abd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100ac0:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100ac3:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ac6:	89 54 24 08          	mov    %edx,0x8(%esp)
  100aca:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100acd:	83 c2 04             	add    $0x4,%edx
  100ad0:	89 54 24 04          	mov    %edx,0x4(%esp)
  100ad4:	89 0c 24             	mov    %ecx,(%esp)
  100ad7:	ff d0                	call   *%eax
  100ad9:	eb 24                	jmp    100aff <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100adb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae2:	83 f8 02             	cmp    $0x2,%eax
  100ae5:	76 9c                	jbe    100a83 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100ae7:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100aea:	89 44 24 04          	mov    %eax,0x4(%esp)
  100aee:	c7 04 24 6b 34 10 00 	movl   $0x10346b,(%esp)
  100af5:	e8 18 f8 ff ff       	call   100312 <cprintf>
    return 0;
  100afa:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100aff:	c9                   	leave  
  100b00:	c3                   	ret    

00100b01 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100b01:	55                   	push   %ebp
  100b02:	89 e5                	mov    %esp,%ebp
  100b04:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100b07:	c7 04 24 84 34 10 00 	movl   $0x103484,(%esp)
  100b0e:	e8 ff f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100b13:	c7 04 24 ac 34 10 00 	movl   $0x1034ac,(%esp)
  100b1a:	e8 f3 f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100b1f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100b23:	74 0b                	je     100b30 <kmonitor+0x2f>
        print_trapframe(tf);
  100b25:	8b 45 08             	mov    0x8(%ebp),%eax
  100b28:	89 04 24             	mov    %eax,(%esp)
  100b2b:	e8 87 0c 00 00       	call   1017b7 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100b30:	c7 04 24 d1 34 10 00 	movl   $0x1034d1,(%esp)
  100b37:	e8 cd f6 ff ff       	call   100209 <readline>
  100b3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100b3f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b43:	74 18                	je     100b5d <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100b45:	8b 45 08             	mov    0x8(%ebp),%eax
  100b48:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b4f:	89 04 24             	mov    %eax,(%esp)
  100b52:	e8 f8 fe ff ff       	call   100a4f <runcmd>
  100b57:	85 c0                	test   %eax,%eax
  100b59:	79 02                	jns    100b5d <kmonitor+0x5c>
                break;
  100b5b:	eb 02                	jmp    100b5f <kmonitor+0x5e>
            }
        }
    }
  100b5d:	eb d1                	jmp    100b30 <kmonitor+0x2f>
}
  100b5f:	c9                   	leave  
  100b60:	c3                   	ret    

00100b61 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100b61:	55                   	push   %ebp
  100b62:	89 e5                	mov    %esp,%ebp
  100b64:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b67:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b6e:	eb 3f                	jmp    100baf <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100b70:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b73:	89 d0                	mov    %edx,%eax
  100b75:	01 c0                	add    %eax,%eax
  100b77:	01 d0                	add    %edx,%eax
  100b79:	c1 e0 02             	shl    $0x2,%eax
  100b7c:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b81:	8b 48 04             	mov    0x4(%eax),%ecx
  100b84:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b87:	89 d0                	mov    %edx,%eax
  100b89:	01 c0                	add    %eax,%eax
  100b8b:	01 d0                	add    %edx,%eax
  100b8d:	c1 e0 02             	shl    $0x2,%eax
  100b90:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b95:	8b 00                	mov    (%eax),%eax
  100b97:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100b9b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b9f:	c7 04 24 d5 34 10 00 	movl   $0x1034d5,(%esp)
  100ba6:	e8 67 f7 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bb2:	83 f8 02             	cmp    $0x2,%eax
  100bb5:	76 b9                	jbe    100b70 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100bb7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bbc:	c9                   	leave  
  100bbd:	c3                   	ret    

00100bbe <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100bbe:	55                   	push   %ebp
  100bbf:	89 e5                	mov    %esp,%ebp
  100bc1:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100bc4:	e8 7d fc ff ff       	call   100846 <print_kerninfo>
    return 0;
  100bc9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bce:	c9                   	leave  
  100bcf:	c3                   	ret    

00100bd0 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100bd0:	55                   	push   %ebp
  100bd1:	89 e5                	mov    %esp,%ebp
  100bd3:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100bd6:	e8 b5 fd ff ff       	call   100990 <print_stackframe>
    return 0;
  100bdb:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100be0:	c9                   	leave  
  100be1:	c3                   	ret    

00100be2 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100be2:	55                   	push   %ebp
  100be3:	89 e5                	mov    %esp,%ebp
  100be5:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100be8:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100bed:	85 c0                	test   %eax,%eax
  100bef:	74 02                	je     100bf3 <__panic+0x11>
        goto panic_dead;
  100bf1:	eb 48                	jmp    100c3b <__panic+0x59>
    }
    is_panic = 1;
  100bf3:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100bfa:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100bfd:	8d 45 14             	lea    0x14(%ebp),%eax
  100c00:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100c03:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c06:	89 44 24 08          	mov    %eax,0x8(%esp)
  100c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  100c0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c11:	c7 04 24 de 34 10 00 	movl   $0x1034de,(%esp)
  100c18:	e8 f5 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100c1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c20:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c24:	8b 45 10             	mov    0x10(%ebp),%eax
  100c27:	89 04 24             	mov    %eax,(%esp)
  100c2a:	e8 b0 f6 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100c2f:	c7 04 24 fa 34 10 00 	movl   $0x1034fa,(%esp)
  100c36:	e8 d7 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100c3b:	e8 22 09 00 00       	call   101562 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100c40:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100c47:	e8 b5 fe ff ff       	call   100b01 <kmonitor>
    }
  100c4c:	eb f2                	jmp    100c40 <__panic+0x5e>

00100c4e <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100c4e:	55                   	push   %ebp
  100c4f:	89 e5                	mov    %esp,%ebp
  100c51:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100c54:	8d 45 14             	lea    0x14(%ebp),%eax
  100c57:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100c5a:	8b 45 0c             	mov    0xc(%ebp),%eax
  100c5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  100c61:	8b 45 08             	mov    0x8(%ebp),%eax
  100c64:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c68:	c7 04 24 fc 34 10 00 	movl   $0x1034fc,(%esp)
  100c6f:	e8 9e f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c77:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c7b:	8b 45 10             	mov    0x10(%ebp),%eax
  100c7e:	89 04 24             	mov    %eax,(%esp)
  100c81:	e8 59 f6 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100c86:	c7 04 24 fa 34 10 00 	movl   $0x1034fa,(%esp)
  100c8d:	e8 80 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100c92:	c9                   	leave  
  100c93:	c3                   	ret    

00100c94 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100c94:	55                   	push   %ebp
  100c95:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100c97:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100c9c:	5d                   	pop    %ebp
  100c9d:	c3                   	ret    

00100c9e <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100c9e:	55                   	push   %ebp
  100c9f:	89 e5                	mov    %esp,%ebp
  100ca1:	83 ec 28             	sub    $0x28,%esp
  100ca4:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100caa:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100cae:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100cb2:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100cb6:	ee                   	out    %al,(%dx)
  100cb7:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100cbd:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100cc1:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100cc5:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100cc9:	ee                   	out    %al,(%dx)
  100cca:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100cd0:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100cd4:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100cd8:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100cdc:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100cdd:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100ce4:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100ce7:	c7 04 24 1a 35 10 00 	movl   $0x10351a,(%esp)
  100cee:	e8 1f f6 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100cf3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cfa:	e8 c1 08 00 00       	call   1015c0 <pic_enable>
}
  100cff:	c9                   	leave  
  100d00:	c3                   	ret    

00100d01 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100d01:	55                   	push   %ebp
  100d02:	89 e5                	mov    %esp,%ebp
  100d04:	83 ec 10             	sub    $0x10,%esp
  100d07:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100d0d:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100d11:	89 c2                	mov    %eax,%edx
  100d13:	ec                   	in     (%dx),%al
  100d14:	88 45 fd             	mov    %al,-0x3(%ebp)
  100d17:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100d1d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100d21:	89 c2                	mov    %eax,%edx
  100d23:	ec                   	in     (%dx),%al
  100d24:	88 45 f9             	mov    %al,-0x7(%ebp)
  100d27:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100d2d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100d31:	89 c2                	mov    %eax,%edx
  100d33:	ec                   	in     (%dx),%al
  100d34:	88 45 f5             	mov    %al,-0xb(%ebp)
  100d37:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100d3d:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100d41:	89 c2                	mov    %eax,%edx
  100d43:	ec                   	in     (%dx),%al
  100d44:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100d47:	c9                   	leave  
  100d48:	c3                   	ret    

00100d49 <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100d49:	55                   	push   %ebp
  100d4a:	89 e5                	mov    %esp,%ebp
  100d4c:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100d4f:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100d56:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d59:	0f b7 00             	movzwl (%eax),%eax
  100d5c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100d60:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d63:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100d68:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d6b:	0f b7 00             	movzwl (%eax),%eax
  100d6e:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100d72:	74 12                	je     100d86 <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100d74:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100d7b:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100d82:	b4 03 
  100d84:	eb 13                	jmp    100d99 <cga_init+0x50>
    } else {
        *cp = was;
  100d86:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100d89:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100d8d:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100d90:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100d97:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100d99:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100da0:	0f b7 c0             	movzwl %ax,%eax
  100da3:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100da7:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dab:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100daf:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100db3:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100db4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100dbb:	83 c0 01             	add    $0x1,%eax
  100dbe:	0f b7 c0             	movzwl %ax,%eax
  100dc1:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc5:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100dc9:	89 c2                	mov    %eax,%edx
  100dcb:	ec                   	in     (%dx),%al
  100dcc:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100dcf:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dd3:	0f b6 c0             	movzbl %al,%eax
  100dd6:	c1 e0 08             	shl    $0x8,%eax
  100dd9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ddc:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100de3:	0f b7 c0             	movzwl %ax,%eax
  100de6:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100dea:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dee:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100df2:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100df6:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100df7:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100dfe:	83 c0 01             	add    $0x1,%eax
  100e01:	0f b7 c0             	movzwl %ax,%eax
  100e04:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e08:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100e0c:	89 c2                	mov    %eax,%edx
  100e0e:	ec                   	in     (%dx),%al
  100e0f:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100e12:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e16:	0f b6 c0             	movzbl %al,%eax
  100e19:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100e1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1f:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100e24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e27:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100e2d:	c9                   	leave  
  100e2e:	c3                   	ret    

00100e2f <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100e2f:	55                   	push   %ebp
  100e30:	89 e5                	mov    %esp,%ebp
  100e32:	83 ec 48             	sub    $0x48,%esp
  100e35:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100e3b:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e3f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100e43:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e47:	ee                   	out    %al,(%dx)
  100e48:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100e4e:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100e52:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e56:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e5a:	ee                   	out    %al,(%dx)
  100e5b:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100e61:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100e65:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e69:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100e6d:	ee                   	out    %al,(%dx)
  100e6e:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100e74:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100e78:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e7c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100e80:	ee                   	out    %al,(%dx)
  100e81:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100e87:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100e8b:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e8f:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e93:	ee                   	out    %al,(%dx)
  100e94:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100e9a:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100e9e:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100ea2:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100ea6:	ee                   	out    %al,(%dx)
  100ea7:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100ead:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100eb1:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100eb5:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100eb9:	ee                   	out    %al,(%dx)
  100eba:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec0:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100ec4:	89 c2                	mov    %eax,%edx
  100ec6:	ec                   	in     (%dx),%al
  100ec7:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100eca:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100ece:	3c ff                	cmp    $0xff,%al
  100ed0:	0f 95 c0             	setne  %al
  100ed3:	0f b6 c0             	movzbl %al,%eax
  100ed6:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100edb:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee1:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100ee5:	89 c2                	mov    %eax,%edx
  100ee7:	ec                   	in     (%dx),%al
  100ee8:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100eeb:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100ef1:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100ef5:	89 c2                	mov    %eax,%edx
  100ef7:	ec                   	in     (%dx),%al
  100ef8:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100efb:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100f00:	85 c0                	test   %eax,%eax
  100f02:	74 0c                	je     100f10 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100f04:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100f0b:	e8 b0 06 00 00       	call   1015c0 <pic_enable>
    }
}
  100f10:	c9                   	leave  
  100f11:	c3                   	ret    

00100f12 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100f12:	55                   	push   %ebp
  100f13:	89 e5                	mov    %esp,%ebp
  100f15:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f18:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100f1f:	eb 09                	jmp    100f2a <lpt_putc_sub+0x18>
        delay();
  100f21:	e8 db fd ff ff       	call   100d01 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100f26:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100f2a:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100f30:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100f34:	89 c2                	mov    %eax,%edx
  100f36:	ec                   	in     (%dx),%al
  100f37:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100f3a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100f3e:	84 c0                	test   %al,%al
  100f40:	78 09                	js     100f4b <lpt_putc_sub+0x39>
  100f42:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100f49:	7e d6                	jle    100f21 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100f4b:	8b 45 08             	mov    0x8(%ebp),%eax
  100f4e:	0f b6 c0             	movzbl %al,%eax
  100f51:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  100f57:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f5a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f5e:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f62:	ee                   	out    %al,(%dx)
  100f63:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  100f69:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  100f6d:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f71:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f75:	ee                   	out    %al,(%dx)
  100f76:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  100f7c:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  100f80:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f84:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f88:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  100f89:	c9                   	leave  
  100f8a:	c3                   	ret    

00100f8b <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  100f8b:	55                   	push   %ebp
  100f8c:	89 e5                	mov    %esp,%ebp
  100f8e:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  100f91:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  100f95:	74 0d                	je     100fa4 <lpt_putc+0x19>
        lpt_putc_sub(c);
  100f97:	8b 45 08             	mov    0x8(%ebp),%eax
  100f9a:	89 04 24             	mov    %eax,(%esp)
  100f9d:	e8 70 ff ff ff       	call   100f12 <lpt_putc_sub>
  100fa2:	eb 24                	jmp    100fc8 <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  100fa4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  100fab:	e8 62 ff ff ff       	call   100f12 <lpt_putc_sub>
        lpt_putc_sub(' ');
  100fb0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100fb7:	e8 56 ff ff ff       	call   100f12 <lpt_putc_sub>
        lpt_putc_sub('\b');
  100fbc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  100fc3:	e8 4a ff ff ff       	call   100f12 <lpt_putc_sub>
    }
}
  100fc8:	c9                   	leave  
  100fc9:	c3                   	ret    

00100fca <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  100fca:	55                   	push   %ebp
  100fcb:	89 e5                	mov    %esp,%ebp
  100fcd:	53                   	push   %ebx
  100fce:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  100fd1:	8b 45 08             	mov    0x8(%ebp),%eax
  100fd4:	b0 00                	mov    $0x0,%al
  100fd6:	85 c0                	test   %eax,%eax
  100fd8:	75 07                	jne    100fe1 <cga_putc+0x17>
        c |= 0x0700;
  100fda:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  100fe1:	8b 45 08             	mov    0x8(%ebp),%eax
  100fe4:	0f b6 c0             	movzbl %al,%eax
  100fe7:	83 f8 0a             	cmp    $0xa,%eax
  100fea:	74 4c                	je     101038 <cga_putc+0x6e>
  100fec:	83 f8 0d             	cmp    $0xd,%eax
  100fef:	74 57                	je     101048 <cga_putc+0x7e>
  100ff1:	83 f8 08             	cmp    $0x8,%eax
  100ff4:	0f 85 88 00 00 00    	jne    101082 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  100ffa:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101001:	66 85 c0             	test   %ax,%ax
  101004:	74 30                	je     101036 <cga_putc+0x6c>
            crt_pos --;
  101006:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10100d:	83 e8 01             	sub    $0x1,%eax
  101010:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101016:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10101b:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  101022:	0f b7 d2             	movzwl %dx,%edx
  101025:	01 d2                	add    %edx,%edx
  101027:	01 c2                	add    %eax,%edx
  101029:	8b 45 08             	mov    0x8(%ebp),%eax
  10102c:	b0 00                	mov    $0x0,%al
  10102e:	83 c8 20             	or     $0x20,%eax
  101031:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101034:	eb 72                	jmp    1010a8 <cga_putc+0xde>
  101036:	eb 70                	jmp    1010a8 <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  101038:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10103f:	83 c0 50             	add    $0x50,%eax
  101042:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101048:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10104f:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101056:	0f b7 c1             	movzwl %cx,%eax
  101059:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  10105f:	c1 e8 10             	shr    $0x10,%eax
  101062:	89 c2                	mov    %eax,%edx
  101064:	66 c1 ea 06          	shr    $0x6,%dx
  101068:	89 d0                	mov    %edx,%eax
  10106a:	c1 e0 02             	shl    $0x2,%eax
  10106d:	01 d0                	add    %edx,%eax
  10106f:	c1 e0 04             	shl    $0x4,%eax
  101072:	29 c1                	sub    %eax,%ecx
  101074:	89 ca                	mov    %ecx,%edx
  101076:	89 d8                	mov    %ebx,%eax
  101078:	29 d0                	sub    %edx,%eax
  10107a:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101080:	eb 26                	jmp    1010a8 <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101082:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101088:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10108f:	8d 50 01             	lea    0x1(%eax),%edx
  101092:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101099:	0f b7 c0             	movzwl %ax,%eax
  10109c:	01 c0                	add    %eax,%eax
  10109e:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1010a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a4:	66 89 02             	mov    %ax,(%edx)
        break;
  1010a7:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  1010a8:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010af:	66 3d cf 07          	cmp    $0x7cf,%ax
  1010b3:	76 5b                	jbe    101110 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1010b5:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010ba:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1010c0:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010c5:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1010cc:	00 
  1010cd:	89 54 24 04          	mov    %edx,0x4(%esp)
  1010d1:	89 04 24             	mov    %eax,(%esp)
  1010d4:	e8 0c 20 00 00       	call   1030e5 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1010d9:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1010e0:	eb 15                	jmp    1010f7 <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1010e2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1010ea:	01 d2                	add    %edx,%edx
  1010ec:	01 d0                	add    %edx,%eax
  1010ee:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1010f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1010f7:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1010fe:	7e e2                	jle    1010e2 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  101100:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101107:	83 e8 50             	sub    $0x50,%eax
  10110a:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101110:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101117:	0f b7 c0             	movzwl %ax,%eax
  10111a:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10111e:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  101122:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101126:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10112a:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  10112b:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101132:	66 c1 e8 08          	shr    $0x8,%ax
  101136:	0f b6 c0             	movzbl %al,%eax
  101139:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101140:	83 c2 01             	add    $0x1,%edx
  101143:	0f b7 d2             	movzwl %dx,%edx
  101146:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  10114a:	88 45 ed             	mov    %al,-0x13(%ebp)
  10114d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101151:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101155:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101156:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10115d:	0f b7 c0             	movzwl %ax,%eax
  101160:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101164:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  101168:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10116c:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101170:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101171:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101178:	0f b6 c0             	movzbl %al,%eax
  10117b:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101182:	83 c2 01             	add    $0x1,%edx
  101185:	0f b7 d2             	movzwl %dx,%edx
  101188:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  10118c:	88 45 e5             	mov    %al,-0x1b(%ebp)
  10118f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101193:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101197:	ee                   	out    %al,(%dx)
}
  101198:	83 c4 34             	add    $0x34,%esp
  10119b:	5b                   	pop    %ebx
  10119c:	5d                   	pop    %ebp
  10119d:	c3                   	ret    

0010119e <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10119e:	55                   	push   %ebp
  10119f:	89 e5                	mov    %esp,%ebp
  1011a1:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011a4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1011ab:	eb 09                	jmp    1011b6 <serial_putc_sub+0x18>
        delay();
  1011ad:	e8 4f fb ff ff       	call   100d01 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  1011b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1011b6:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1011bc:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1011c0:	89 c2                	mov    %eax,%edx
  1011c2:	ec                   	in     (%dx),%al
  1011c3:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1011c6:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1011ca:	0f b6 c0             	movzbl %al,%eax
  1011cd:	83 e0 20             	and    $0x20,%eax
  1011d0:	85 c0                	test   %eax,%eax
  1011d2:	75 09                	jne    1011dd <serial_putc_sub+0x3f>
  1011d4:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1011db:	7e d0                	jle    1011ad <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1011dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1011e0:	0f b6 c0             	movzbl %al,%eax
  1011e3:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1011e9:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1011ec:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1011f0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1011f4:	ee                   	out    %al,(%dx)
}
  1011f5:	c9                   	leave  
  1011f6:	c3                   	ret    

001011f7 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1011f7:	55                   	push   %ebp
  1011f8:	89 e5                	mov    %esp,%ebp
  1011fa:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1011fd:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101201:	74 0d                	je     101210 <serial_putc+0x19>
        serial_putc_sub(c);
  101203:	8b 45 08             	mov    0x8(%ebp),%eax
  101206:	89 04 24             	mov    %eax,(%esp)
  101209:	e8 90 ff ff ff       	call   10119e <serial_putc_sub>
  10120e:	eb 24                	jmp    101234 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  101210:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101217:	e8 82 ff ff ff       	call   10119e <serial_putc_sub>
        serial_putc_sub(' ');
  10121c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101223:	e8 76 ff ff ff       	call   10119e <serial_putc_sub>
        serial_putc_sub('\b');
  101228:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10122f:	e8 6a ff ff ff       	call   10119e <serial_putc_sub>
    }
}
  101234:	c9                   	leave  
  101235:	c3                   	ret    

00101236 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101236:	55                   	push   %ebp
  101237:	89 e5                	mov    %esp,%ebp
  101239:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  10123c:	eb 33                	jmp    101271 <cons_intr+0x3b>
        if (c != 0) {
  10123e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101242:	74 2d                	je     101271 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101244:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101249:	8d 50 01             	lea    0x1(%eax),%edx
  10124c:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101252:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101255:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10125b:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101260:	3d 00 02 00 00       	cmp    $0x200,%eax
  101265:	75 0a                	jne    101271 <cons_intr+0x3b>
                cons.wpos = 0;
  101267:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  10126e:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101271:	8b 45 08             	mov    0x8(%ebp),%eax
  101274:	ff d0                	call   *%eax
  101276:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101279:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  10127d:	75 bf                	jne    10123e <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10127f:	c9                   	leave  
  101280:	c3                   	ret    

00101281 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101281:	55                   	push   %ebp
  101282:	89 e5                	mov    %esp,%ebp
  101284:	83 ec 10             	sub    $0x10,%esp
  101287:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10128d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101291:	89 c2                	mov    %eax,%edx
  101293:	ec                   	in     (%dx),%al
  101294:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101297:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10129b:	0f b6 c0             	movzbl %al,%eax
  10129e:	83 e0 01             	and    $0x1,%eax
  1012a1:	85 c0                	test   %eax,%eax
  1012a3:	75 07                	jne    1012ac <serial_proc_data+0x2b>
        return -1;
  1012a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1012aa:	eb 2a                	jmp    1012d6 <serial_proc_data+0x55>
  1012ac:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012b2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1012b6:	89 c2                	mov    %eax,%edx
  1012b8:	ec                   	in     (%dx),%al
  1012b9:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1012bc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1012c0:	0f b6 c0             	movzbl %al,%eax
  1012c3:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1012c6:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1012ca:	75 07                	jne    1012d3 <serial_proc_data+0x52>
        c = '\b';
  1012cc:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1012d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1012d6:	c9                   	leave  
  1012d7:	c3                   	ret    

001012d8 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1012d8:	55                   	push   %ebp
  1012d9:	89 e5                	mov    %esp,%ebp
  1012db:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1012de:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1012e3:	85 c0                	test   %eax,%eax
  1012e5:	74 0c                	je     1012f3 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1012e7:	c7 04 24 81 12 10 00 	movl   $0x101281,(%esp)
  1012ee:	e8 43 ff ff ff       	call   101236 <cons_intr>
    }
}
  1012f3:	c9                   	leave  
  1012f4:	c3                   	ret    

001012f5 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1012f5:	55                   	push   %ebp
  1012f6:	89 e5                	mov    %esp,%ebp
  1012f8:	83 ec 38             	sub    $0x38,%esp
  1012fb:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101301:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  101305:	89 c2                	mov    %eax,%edx
  101307:	ec                   	in     (%dx),%al
  101308:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10130b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  10130f:	0f b6 c0             	movzbl %al,%eax
  101312:	83 e0 01             	and    $0x1,%eax
  101315:	85 c0                	test   %eax,%eax
  101317:	75 0a                	jne    101323 <kbd_proc_data+0x2e>
        return -1;
  101319:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10131e:	e9 59 01 00 00       	jmp    10147c <kbd_proc_data+0x187>
  101323:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101329:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10132d:	89 c2                	mov    %eax,%edx
  10132f:	ec                   	in     (%dx),%al
  101330:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  101333:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101337:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  10133a:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  10133e:	75 17                	jne    101357 <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101340:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101345:	83 c8 40             	or     $0x40,%eax
  101348:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10134d:	b8 00 00 00 00       	mov    $0x0,%eax
  101352:	e9 25 01 00 00       	jmp    10147c <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  101357:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10135b:	84 c0                	test   %al,%al
  10135d:	79 47                	jns    1013a6 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  10135f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101364:	83 e0 40             	and    $0x40,%eax
  101367:	85 c0                	test   %eax,%eax
  101369:	75 09                	jne    101374 <kbd_proc_data+0x7f>
  10136b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10136f:	83 e0 7f             	and    $0x7f,%eax
  101372:	eb 04                	jmp    101378 <kbd_proc_data+0x83>
  101374:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101378:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10137b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10137f:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101386:	83 c8 40             	or     $0x40,%eax
  101389:	0f b6 c0             	movzbl %al,%eax
  10138c:	f7 d0                	not    %eax
  10138e:	89 c2                	mov    %eax,%edx
  101390:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101395:	21 d0                	and    %edx,%eax
  101397:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  10139c:	b8 00 00 00 00       	mov    $0x0,%eax
  1013a1:	e9 d6 00 00 00       	jmp    10147c <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  1013a6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013ab:	83 e0 40             	and    $0x40,%eax
  1013ae:	85 c0                	test   %eax,%eax
  1013b0:	74 11                	je     1013c3 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  1013b2:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  1013b6:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013bb:	83 e0 bf             	and    $0xffffffbf,%eax
  1013be:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1013c3:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013c7:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1013ce:	0f b6 d0             	movzbl %al,%edx
  1013d1:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013d6:	09 d0                	or     %edx,%eax
  1013d8:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1013dd:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1013e1:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1013e8:	0f b6 d0             	movzbl %al,%edx
  1013eb:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013f0:	31 d0                	xor    %edx,%eax
  1013f2:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1013f7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013fc:	83 e0 03             	and    $0x3,%eax
  1013ff:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  101406:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10140a:	01 d0                	add    %edx,%eax
  10140c:	0f b6 00             	movzbl (%eax),%eax
  10140f:	0f b6 c0             	movzbl %al,%eax
  101412:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101415:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10141a:	83 e0 08             	and    $0x8,%eax
  10141d:	85 c0                	test   %eax,%eax
  10141f:	74 22                	je     101443 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  101421:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101425:	7e 0c                	jle    101433 <kbd_proc_data+0x13e>
  101427:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10142b:	7f 06                	jg     101433 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  10142d:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101431:	eb 10                	jmp    101443 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  101433:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  101437:	7e 0a                	jle    101443 <kbd_proc_data+0x14e>
  101439:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  10143d:	7f 04                	jg     101443 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  10143f:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101443:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101448:	f7 d0                	not    %eax
  10144a:	83 e0 06             	and    $0x6,%eax
  10144d:	85 c0                	test   %eax,%eax
  10144f:	75 28                	jne    101479 <kbd_proc_data+0x184>
  101451:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101458:	75 1f                	jne    101479 <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  10145a:	c7 04 24 35 35 10 00 	movl   $0x103535,(%esp)
  101461:	e8 ac ee ff ff       	call   100312 <cprintf>
  101466:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  10146c:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101470:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101474:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  101478:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101479:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10147c:	c9                   	leave  
  10147d:	c3                   	ret    

0010147e <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  10147e:	55                   	push   %ebp
  10147f:	89 e5                	mov    %esp,%ebp
  101481:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101484:	c7 04 24 f5 12 10 00 	movl   $0x1012f5,(%esp)
  10148b:	e8 a6 fd ff ff       	call   101236 <cons_intr>
}
  101490:	c9                   	leave  
  101491:	c3                   	ret    

00101492 <kbd_init>:

static void
kbd_init(void) {
  101492:	55                   	push   %ebp
  101493:	89 e5                	mov    %esp,%ebp
  101495:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101498:	e8 e1 ff ff ff       	call   10147e <kbd_intr>
    pic_enable(IRQ_KBD);
  10149d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1014a4:	e8 17 01 00 00       	call   1015c0 <pic_enable>
}
  1014a9:	c9                   	leave  
  1014aa:	c3                   	ret    

001014ab <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  1014ab:	55                   	push   %ebp
  1014ac:	89 e5                	mov    %esp,%ebp
  1014ae:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  1014b1:	e8 93 f8 ff ff       	call   100d49 <cga_init>
    serial_init();
  1014b6:	e8 74 f9 ff ff       	call   100e2f <serial_init>
    kbd_init();
  1014bb:	e8 d2 ff ff ff       	call   101492 <kbd_init>
    if (!serial_exists) {
  1014c0:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1014c5:	85 c0                	test   %eax,%eax
  1014c7:	75 0c                	jne    1014d5 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1014c9:	c7 04 24 41 35 10 00 	movl   $0x103541,(%esp)
  1014d0:	e8 3d ee ff ff       	call   100312 <cprintf>
    }
}
  1014d5:	c9                   	leave  
  1014d6:	c3                   	ret    

001014d7 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1014d7:	55                   	push   %ebp
  1014d8:	89 e5                	mov    %esp,%ebp
  1014da:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1014dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1014e0:	89 04 24             	mov    %eax,(%esp)
  1014e3:	e8 a3 fa ff ff       	call   100f8b <lpt_putc>
    cga_putc(c);
  1014e8:	8b 45 08             	mov    0x8(%ebp),%eax
  1014eb:	89 04 24             	mov    %eax,(%esp)
  1014ee:	e8 d7 fa ff ff       	call   100fca <cga_putc>
    serial_putc(c);
  1014f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1014f6:	89 04 24             	mov    %eax,(%esp)
  1014f9:	e8 f9 fc ff ff       	call   1011f7 <serial_putc>
}
  1014fe:	c9                   	leave  
  1014ff:	c3                   	ret    

00101500 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101500:	55                   	push   %ebp
  101501:	89 e5                	mov    %esp,%ebp
  101503:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  101506:	e8 cd fd ff ff       	call   1012d8 <serial_intr>
    kbd_intr();
  10150b:	e8 6e ff ff ff       	call   10147e <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101510:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101516:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10151b:	39 c2                	cmp    %eax,%edx
  10151d:	74 36                	je     101555 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10151f:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101524:	8d 50 01             	lea    0x1(%eax),%edx
  101527:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  10152d:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101534:	0f b6 c0             	movzbl %al,%eax
  101537:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  10153a:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10153f:	3d 00 02 00 00       	cmp    $0x200,%eax
  101544:	75 0a                	jne    101550 <cons_getc+0x50>
            cons.rpos = 0;
  101546:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  10154d:	00 00 00 
        }
        return c;
  101550:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101553:	eb 05                	jmp    10155a <cons_getc+0x5a>
    }
    return 0;
  101555:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10155a:	c9                   	leave  
  10155b:	c3                   	ret    

0010155c <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10155c:	55                   	push   %ebp
  10155d:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  10155f:	fb                   	sti    
    sti();
}
  101560:	5d                   	pop    %ebp
  101561:	c3                   	ret    

00101562 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101562:	55                   	push   %ebp
  101563:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101565:	fa                   	cli    
    cli();
}
  101566:	5d                   	pop    %ebp
  101567:	c3                   	ret    

00101568 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101568:	55                   	push   %ebp
  101569:	89 e5                	mov    %esp,%ebp
  10156b:	83 ec 14             	sub    $0x14,%esp
  10156e:	8b 45 08             	mov    0x8(%ebp),%eax
  101571:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101575:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101579:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10157f:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101584:	85 c0                	test   %eax,%eax
  101586:	74 36                	je     1015be <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  101588:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10158c:	0f b6 c0             	movzbl %al,%eax
  10158f:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101595:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101598:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10159c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1015a0:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  1015a1:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1015a5:	66 c1 e8 08          	shr    $0x8,%ax
  1015a9:	0f b6 c0             	movzbl %al,%eax
  1015ac:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1015b2:	88 45 f9             	mov    %al,-0x7(%ebp)
  1015b5:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1015b9:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1015bd:	ee                   	out    %al,(%dx)
    }
}
  1015be:	c9                   	leave  
  1015bf:	c3                   	ret    

001015c0 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1015c0:	55                   	push   %ebp
  1015c1:	89 e5                	mov    %esp,%ebp
  1015c3:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1015c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1015c9:	ba 01 00 00 00       	mov    $0x1,%edx
  1015ce:	89 c1                	mov    %eax,%ecx
  1015d0:	d3 e2                	shl    %cl,%edx
  1015d2:	89 d0                	mov    %edx,%eax
  1015d4:	f7 d0                	not    %eax
  1015d6:	89 c2                	mov    %eax,%edx
  1015d8:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1015df:	21 d0                	and    %edx,%eax
  1015e1:	0f b7 c0             	movzwl %ax,%eax
  1015e4:	89 04 24             	mov    %eax,(%esp)
  1015e7:	e8 7c ff ff ff       	call   101568 <pic_setmask>
}
  1015ec:	c9                   	leave  
  1015ed:	c3                   	ret    

001015ee <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1015ee:	55                   	push   %ebp
  1015ef:	89 e5                	mov    %esp,%ebp
  1015f1:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1015f4:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1015fb:	00 00 00 
  1015fe:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101604:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  101608:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10160c:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101610:	ee                   	out    %al,(%dx)
  101611:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101617:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  10161b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10161f:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101623:	ee                   	out    %al,(%dx)
  101624:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  10162a:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  10162e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101632:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101636:	ee                   	out    %al,(%dx)
  101637:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  10163d:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  101641:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101645:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101649:	ee                   	out    %al,(%dx)
  10164a:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101650:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101654:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101658:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10165c:	ee                   	out    %al,(%dx)
  10165d:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101663:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  101667:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10166b:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10166f:	ee                   	out    %al,(%dx)
  101670:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  101676:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10167a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10167e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101682:	ee                   	out    %al,(%dx)
  101683:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  101689:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  10168d:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101691:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101695:	ee                   	out    %al,(%dx)
  101696:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  10169c:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  1016a0:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  1016a4:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  1016a8:	ee                   	out    %al,(%dx)
  1016a9:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  1016af:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  1016b3:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1016b7:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1016bb:	ee                   	out    %al,(%dx)
  1016bc:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  1016c2:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  1016c6:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1016ca:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1016ce:	ee                   	out    %al,(%dx)
  1016cf:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1016d5:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  1016d9:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1016dd:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1016e1:	ee                   	out    %al,(%dx)
  1016e2:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1016e8:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1016ec:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1016f0:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1016f4:	ee                   	out    %al,(%dx)
  1016f5:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1016fb:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1016ff:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  101703:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  101707:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  101708:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10170f:	66 83 f8 ff          	cmp    $0xffff,%ax
  101713:	74 12                	je     101727 <pic_init+0x139>
        pic_setmask(irq_mask);
  101715:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  10171c:	0f b7 c0             	movzwl %ax,%eax
  10171f:	89 04 24             	mov    %eax,(%esp)
  101722:	e8 41 fe ff ff       	call   101568 <pic_setmask>
    }
}
  101727:	c9                   	leave  
  101728:	c3                   	ret    

00101729 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101729:	55                   	push   %ebp
  10172a:	89 e5                	mov    %esp,%ebp
  10172c:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10172f:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101736:	00 
  101737:	c7 04 24 60 35 10 00 	movl   $0x103560,(%esp)
  10173e:	e8 cf eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  101743:	c7 04 24 6a 35 10 00 	movl   $0x10356a,(%esp)
  10174a:	e8 c3 eb ff ff       	call   100312 <cprintf>
    panic("EOT: kernel seems ok.");
  10174f:	c7 44 24 08 78 35 10 	movl   $0x103578,0x8(%esp)
  101756:	00 
  101757:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  10175e:	00 
  10175f:	c7 04 24 8e 35 10 00 	movl   $0x10358e,(%esp)
  101766:	e8 77 f4 ff ff       	call   100be2 <__panic>

0010176b <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10176b:	55                   	push   %ebp
  10176c:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  10176e:	5d                   	pop    %ebp
  10176f:	c3                   	ret    

00101770 <trapname>:

static const char *
trapname(int trapno) {
  101770:	55                   	push   %ebp
  101771:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101773:	8b 45 08             	mov    0x8(%ebp),%eax
  101776:	83 f8 13             	cmp    $0x13,%eax
  101779:	77 0c                	ja     101787 <trapname+0x17>
        return excnames[trapno];
  10177b:	8b 45 08             	mov    0x8(%ebp),%eax
  10177e:	8b 04 85 e0 38 10 00 	mov    0x1038e0(,%eax,4),%eax
  101785:	eb 18                	jmp    10179f <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101787:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10178b:	7e 0d                	jle    10179a <trapname+0x2a>
  10178d:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101791:	7f 07                	jg     10179a <trapname+0x2a>
        return "Hardware Interrupt";
  101793:	b8 9f 35 10 00       	mov    $0x10359f,%eax
  101798:	eb 05                	jmp    10179f <trapname+0x2f>
    }
    return "(unknown trap)";
  10179a:	b8 b2 35 10 00       	mov    $0x1035b2,%eax
}
  10179f:	5d                   	pop    %ebp
  1017a0:	c3                   	ret    

001017a1 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1017a1:	55                   	push   %ebp
  1017a2:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1017a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1017a7:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1017ab:	66 83 f8 08          	cmp    $0x8,%ax
  1017af:	0f 94 c0             	sete   %al
  1017b2:	0f b6 c0             	movzbl %al,%eax
}
  1017b5:	5d                   	pop    %ebp
  1017b6:	c3                   	ret    

001017b7 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1017b7:	55                   	push   %ebp
  1017b8:	89 e5                	mov    %esp,%ebp
  1017ba:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1017bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1017c0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017c4:	c7 04 24 f3 35 10 00 	movl   $0x1035f3,(%esp)
  1017cb:	e8 42 eb ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  1017d0:	8b 45 08             	mov    0x8(%ebp),%eax
  1017d3:	89 04 24             	mov    %eax,(%esp)
  1017d6:	e8 a1 01 00 00       	call   10197c <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1017db:	8b 45 08             	mov    0x8(%ebp),%eax
  1017de:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1017e2:	0f b7 c0             	movzwl %ax,%eax
  1017e5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1017e9:	c7 04 24 04 36 10 00 	movl   $0x103604,(%esp)
  1017f0:	e8 1d eb ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1017f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1017f8:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1017fc:	0f b7 c0             	movzwl %ax,%eax
  1017ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  101803:	c7 04 24 17 36 10 00 	movl   $0x103617,(%esp)
  10180a:	e8 03 eb ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10180f:	8b 45 08             	mov    0x8(%ebp),%eax
  101812:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101816:	0f b7 c0             	movzwl %ax,%eax
  101819:	89 44 24 04          	mov    %eax,0x4(%esp)
  10181d:	c7 04 24 2a 36 10 00 	movl   $0x10362a,(%esp)
  101824:	e8 e9 ea ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101829:	8b 45 08             	mov    0x8(%ebp),%eax
  10182c:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101830:	0f b7 c0             	movzwl %ax,%eax
  101833:	89 44 24 04          	mov    %eax,0x4(%esp)
  101837:	c7 04 24 3d 36 10 00 	movl   $0x10363d,(%esp)
  10183e:	e8 cf ea ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101843:	8b 45 08             	mov    0x8(%ebp),%eax
  101846:	8b 40 30             	mov    0x30(%eax),%eax
  101849:	89 04 24             	mov    %eax,(%esp)
  10184c:	e8 1f ff ff ff       	call   101770 <trapname>
  101851:	8b 55 08             	mov    0x8(%ebp),%edx
  101854:	8b 52 30             	mov    0x30(%edx),%edx
  101857:	89 44 24 08          	mov    %eax,0x8(%esp)
  10185b:	89 54 24 04          	mov    %edx,0x4(%esp)
  10185f:	c7 04 24 50 36 10 00 	movl   $0x103650,(%esp)
  101866:	e8 a7 ea ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  10186b:	8b 45 08             	mov    0x8(%ebp),%eax
  10186e:	8b 40 34             	mov    0x34(%eax),%eax
  101871:	89 44 24 04          	mov    %eax,0x4(%esp)
  101875:	c7 04 24 62 36 10 00 	movl   $0x103662,(%esp)
  10187c:	e8 91 ea ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101881:	8b 45 08             	mov    0x8(%ebp),%eax
  101884:	8b 40 38             	mov    0x38(%eax),%eax
  101887:	89 44 24 04          	mov    %eax,0x4(%esp)
  10188b:	c7 04 24 71 36 10 00 	movl   $0x103671,(%esp)
  101892:	e8 7b ea ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101897:	8b 45 08             	mov    0x8(%ebp),%eax
  10189a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10189e:	0f b7 c0             	movzwl %ax,%eax
  1018a1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018a5:	c7 04 24 80 36 10 00 	movl   $0x103680,(%esp)
  1018ac:	e8 61 ea ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  1018b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b4:	8b 40 40             	mov    0x40(%eax),%eax
  1018b7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018bb:	c7 04 24 93 36 10 00 	movl   $0x103693,(%esp)
  1018c2:	e8 4b ea ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1018c7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1018ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  1018d5:	eb 3e                	jmp    101915 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  1018d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1018da:	8b 50 40             	mov    0x40(%eax),%edx
  1018dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1018e0:	21 d0                	and    %edx,%eax
  1018e2:	85 c0                	test   %eax,%eax
  1018e4:	74 28                	je     10190e <print_trapframe+0x157>
  1018e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018e9:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  1018f0:	85 c0                	test   %eax,%eax
  1018f2:	74 1a                	je     10190e <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  1018f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1018f7:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  1018fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101902:	c7 04 24 a2 36 10 00 	movl   $0x1036a2,(%esp)
  101909:	e8 04 ea ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  10190e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101912:	d1 65 f0             	shll   -0x10(%ebp)
  101915:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101918:	83 f8 17             	cmp    $0x17,%eax
  10191b:	76 ba                	jbe    1018d7 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  10191d:	8b 45 08             	mov    0x8(%ebp),%eax
  101920:	8b 40 40             	mov    0x40(%eax),%eax
  101923:	25 00 30 00 00       	and    $0x3000,%eax
  101928:	c1 e8 0c             	shr    $0xc,%eax
  10192b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10192f:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  101936:	e8 d7 e9 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  10193b:	8b 45 08             	mov    0x8(%ebp),%eax
  10193e:	89 04 24             	mov    %eax,(%esp)
  101941:	e8 5b fe ff ff       	call   1017a1 <trap_in_kernel>
  101946:	85 c0                	test   %eax,%eax
  101948:	75 30                	jne    10197a <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  10194a:	8b 45 08             	mov    0x8(%ebp),%eax
  10194d:	8b 40 44             	mov    0x44(%eax),%eax
  101950:	89 44 24 04          	mov    %eax,0x4(%esp)
  101954:	c7 04 24 af 36 10 00 	movl   $0x1036af,(%esp)
  10195b:	e8 b2 e9 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101960:	8b 45 08             	mov    0x8(%ebp),%eax
  101963:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101967:	0f b7 c0             	movzwl %ax,%eax
  10196a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10196e:	c7 04 24 be 36 10 00 	movl   $0x1036be,(%esp)
  101975:	e8 98 e9 ff ff       	call   100312 <cprintf>
    }
}
  10197a:	c9                   	leave  
  10197b:	c3                   	ret    

0010197c <print_regs>:

void
print_regs(struct pushregs *regs) {
  10197c:	55                   	push   %ebp
  10197d:	89 e5                	mov    %esp,%ebp
  10197f:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101982:	8b 45 08             	mov    0x8(%ebp),%eax
  101985:	8b 00                	mov    (%eax),%eax
  101987:	89 44 24 04          	mov    %eax,0x4(%esp)
  10198b:	c7 04 24 d1 36 10 00 	movl   $0x1036d1,(%esp)
  101992:	e8 7b e9 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101997:	8b 45 08             	mov    0x8(%ebp),%eax
  10199a:	8b 40 04             	mov    0x4(%eax),%eax
  10199d:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019a1:	c7 04 24 e0 36 10 00 	movl   $0x1036e0,(%esp)
  1019a8:	e8 65 e9 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  1019ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b0:	8b 40 08             	mov    0x8(%eax),%eax
  1019b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019b7:	c7 04 24 ef 36 10 00 	movl   $0x1036ef,(%esp)
  1019be:	e8 4f e9 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  1019c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1019c6:	8b 40 0c             	mov    0xc(%eax),%eax
  1019c9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019cd:	c7 04 24 fe 36 10 00 	movl   $0x1036fe,(%esp)
  1019d4:	e8 39 e9 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  1019d9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dc:	8b 40 10             	mov    0x10(%eax),%eax
  1019df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019e3:	c7 04 24 0d 37 10 00 	movl   $0x10370d,(%esp)
  1019ea:	e8 23 e9 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  1019ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f2:	8b 40 14             	mov    0x14(%eax),%eax
  1019f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f9:	c7 04 24 1c 37 10 00 	movl   $0x10371c,(%esp)
  101a00:	e8 0d e9 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101a05:	8b 45 08             	mov    0x8(%ebp),%eax
  101a08:	8b 40 18             	mov    0x18(%eax),%eax
  101a0b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a0f:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  101a16:	e8 f7 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101a1b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1e:	8b 40 1c             	mov    0x1c(%eax),%eax
  101a21:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a25:	c7 04 24 3a 37 10 00 	movl   $0x10373a,(%esp)
  101a2c:	e8 e1 e8 ff ff       	call   100312 <cprintf>
}
  101a31:	c9                   	leave  
  101a32:	c3                   	ret    

00101a33 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101a33:	55                   	push   %ebp
  101a34:	89 e5                	mov    %esp,%ebp
  101a36:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101a39:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3c:	8b 40 30             	mov    0x30(%eax),%eax
  101a3f:	83 f8 2f             	cmp    $0x2f,%eax
  101a42:	77 1e                	ja     101a62 <trap_dispatch+0x2f>
  101a44:	83 f8 2e             	cmp    $0x2e,%eax
  101a47:	0f 83 bf 00 00 00    	jae    101b0c <trap_dispatch+0xd9>
  101a4d:	83 f8 21             	cmp    $0x21,%eax
  101a50:	74 40                	je     101a92 <trap_dispatch+0x5f>
  101a52:	83 f8 24             	cmp    $0x24,%eax
  101a55:	74 15                	je     101a6c <trap_dispatch+0x39>
  101a57:	83 f8 20             	cmp    $0x20,%eax
  101a5a:	0f 84 af 00 00 00    	je     101b0f <trap_dispatch+0xdc>
  101a60:	eb 72                	jmp    101ad4 <trap_dispatch+0xa1>
  101a62:	83 e8 78             	sub    $0x78,%eax
  101a65:	83 f8 01             	cmp    $0x1,%eax
  101a68:	77 6a                	ja     101ad4 <trap_dispatch+0xa1>
  101a6a:	eb 4c                	jmp    101ab8 <trap_dispatch+0x85>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101a6c:	e8 8f fa ff ff       	call   101500 <cons_getc>
  101a71:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101a74:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101a78:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101a7c:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a80:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a84:	c7 04 24 49 37 10 00 	movl   $0x103749,(%esp)
  101a8b:	e8 82 e8 ff ff       	call   100312 <cprintf>
        break;
  101a90:	eb 7e                	jmp    101b10 <trap_dispatch+0xdd>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101a92:	e8 69 fa ff ff       	call   101500 <cons_getc>
  101a97:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101a9a:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101a9e:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101aa2:	89 54 24 08          	mov    %edx,0x8(%esp)
  101aa6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aaa:	c7 04 24 5b 37 10 00 	movl   $0x10375b,(%esp)
  101ab1:	e8 5c e8 ff ff       	call   100312 <cprintf>
        break;
  101ab6:	eb 58                	jmp    101b10 <trap_dispatch+0xdd>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101ab8:	c7 44 24 08 6a 37 10 	movl   $0x10376a,0x8(%esp)
  101abf:	00 
  101ac0:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101ac7:	00 
  101ac8:	c7 04 24 8e 35 10 00 	movl   $0x10358e,(%esp)
  101acf:	e8 0e f1 ff ff       	call   100be2 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ad4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad7:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101adb:	0f b7 c0             	movzwl %ax,%eax
  101ade:	83 e0 03             	and    $0x3,%eax
  101ae1:	85 c0                	test   %eax,%eax
  101ae3:	75 2b                	jne    101b10 <trap_dispatch+0xdd>
            print_trapframe(tf);
  101ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ae8:	89 04 24             	mov    %eax,(%esp)
  101aeb:	e8 c7 fc ff ff       	call   1017b7 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101af0:	c7 44 24 08 7a 37 10 	movl   $0x10377a,0x8(%esp)
  101af7:	00 
  101af8:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101aff:	00 
  101b00:	c7 04 24 8e 35 10 00 	movl   $0x10358e,(%esp)
  101b07:	e8 d6 f0 ff ff       	call   100be2 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101b0c:	90                   	nop
  101b0d:	eb 01                	jmp    101b10 <trap_dispatch+0xdd>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  101b0f:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101b10:	c9                   	leave  
  101b11:	c3                   	ret    

00101b12 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101b12:	55                   	push   %ebp
  101b13:	89 e5                	mov    %esp,%ebp
  101b15:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101b18:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1b:	89 04 24             	mov    %eax,(%esp)
  101b1e:	e8 10 ff ff ff       	call   101a33 <trap_dispatch>
}
  101b23:	c9                   	leave  
  101b24:	c3                   	ret    

00101b25 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101b25:	1e                   	push   %ds
    pushl %es
  101b26:	06                   	push   %es
    pushl %fs
  101b27:	0f a0                	push   %fs
    pushl %gs
  101b29:	0f a8                	push   %gs
    pushal
  101b2b:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101b2c:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101b31:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101b33:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101b35:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101b36:	e8 d7 ff ff ff       	call   101b12 <trap>

    # pop the pushed stack pointer
    popl %esp
  101b3b:	5c                   	pop    %esp

00101b3c <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101b3c:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101b3d:	0f a9                	pop    %gs
    popl %fs
  101b3f:	0f a1                	pop    %fs
    popl %es
  101b41:	07                   	pop    %es
    popl %ds
  101b42:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101b43:	83 c4 08             	add    $0x8,%esp
    iret
  101b46:	cf                   	iret   

00101b47 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101b47:	6a 00                	push   $0x0
  pushl $0
  101b49:	6a 00                	push   $0x0
  jmp __alltraps
  101b4b:	e9 d5 ff ff ff       	jmp    101b25 <__alltraps>

00101b50 <vector1>:
.globl vector1
vector1:
  pushl $0
  101b50:	6a 00                	push   $0x0
  pushl $1
  101b52:	6a 01                	push   $0x1
  jmp __alltraps
  101b54:	e9 cc ff ff ff       	jmp    101b25 <__alltraps>

00101b59 <vector2>:
.globl vector2
vector2:
  pushl $0
  101b59:	6a 00                	push   $0x0
  pushl $2
  101b5b:	6a 02                	push   $0x2
  jmp __alltraps
  101b5d:	e9 c3 ff ff ff       	jmp    101b25 <__alltraps>

00101b62 <vector3>:
.globl vector3
vector3:
  pushl $0
  101b62:	6a 00                	push   $0x0
  pushl $3
  101b64:	6a 03                	push   $0x3
  jmp __alltraps
  101b66:	e9 ba ff ff ff       	jmp    101b25 <__alltraps>

00101b6b <vector4>:
.globl vector4
vector4:
  pushl $0
  101b6b:	6a 00                	push   $0x0
  pushl $4
  101b6d:	6a 04                	push   $0x4
  jmp __alltraps
  101b6f:	e9 b1 ff ff ff       	jmp    101b25 <__alltraps>

00101b74 <vector5>:
.globl vector5
vector5:
  pushl $0
  101b74:	6a 00                	push   $0x0
  pushl $5
  101b76:	6a 05                	push   $0x5
  jmp __alltraps
  101b78:	e9 a8 ff ff ff       	jmp    101b25 <__alltraps>

00101b7d <vector6>:
.globl vector6
vector6:
  pushl $0
  101b7d:	6a 00                	push   $0x0
  pushl $6
  101b7f:	6a 06                	push   $0x6
  jmp __alltraps
  101b81:	e9 9f ff ff ff       	jmp    101b25 <__alltraps>

00101b86 <vector7>:
.globl vector7
vector7:
  pushl $0
  101b86:	6a 00                	push   $0x0
  pushl $7
  101b88:	6a 07                	push   $0x7
  jmp __alltraps
  101b8a:	e9 96 ff ff ff       	jmp    101b25 <__alltraps>

00101b8f <vector8>:
.globl vector8
vector8:
  pushl $8
  101b8f:	6a 08                	push   $0x8
  jmp __alltraps
  101b91:	e9 8f ff ff ff       	jmp    101b25 <__alltraps>

00101b96 <vector9>:
.globl vector9
vector9:
  pushl $9
  101b96:	6a 09                	push   $0x9
  jmp __alltraps
  101b98:	e9 88 ff ff ff       	jmp    101b25 <__alltraps>

00101b9d <vector10>:
.globl vector10
vector10:
  pushl $10
  101b9d:	6a 0a                	push   $0xa
  jmp __alltraps
  101b9f:	e9 81 ff ff ff       	jmp    101b25 <__alltraps>

00101ba4 <vector11>:
.globl vector11
vector11:
  pushl $11
  101ba4:	6a 0b                	push   $0xb
  jmp __alltraps
  101ba6:	e9 7a ff ff ff       	jmp    101b25 <__alltraps>

00101bab <vector12>:
.globl vector12
vector12:
  pushl $12
  101bab:	6a 0c                	push   $0xc
  jmp __alltraps
  101bad:	e9 73 ff ff ff       	jmp    101b25 <__alltraps>

00101bb2 <vector13>:
.globl vector13
vector13:
  pushl $13
  101bb2:	6a 0d                	push   $0xd
  jmp __alltraps
  101bb4:	e9 6c ff ff ff       	jmp    101b25 <__alltraps>

00101bb9 <vector14>:
.globl vector14
vector14:
  pushl $14
  101bb9:	6a 0e                	push   $0xe
  jmp __alltraps
  101bbb:	e9 65 ff ff ff       	jmp    101b25 <__alltraps>

00101bc0 <vector15>:
.globl vector15
vector15:
  pushl $0
  101bc0:	6a 00                	push   $0x0
  pushl $15
  101bc2:	6a 0f                	push   $0xf
  jmp __alltraps
  101bc4:	e9 5c ff ff ff       	jmp    101b25 <__alltraps>

00101bc9 <vector16>:
.globl vector16
vector16:
  pushl $0
  101bc9:	6a 00                	push   $0x0
  pushl $16
  101bcb:	6a 10                	push   $0x10
  jmp __alltraps
  101bcd:	e9 53 ff ff ff       	jmp    101b25 <__alltraps>

00101bd2 <vector17>:
.globl vector17
vector17:
  pushl $17
  101bd2:	6a 11                	push   $0x11
  jmp __alltraps
  101bd4:	e9 4c ff ff ff       	jmp    101b25 <__alltraps>

00101bd9 <vector18>:
.globl vector18
vector18:
  pushl $0
  101bd9:	6a 00                	push   $0x0
  pushl $18
  101bdb:	6a 12                	push   $0x12
  jmp __alltraps
  101bdd:	e9 43 ff ff ff       	jmp    101b25 <__alltraps>

00101be2 <vector19>:
.globl vector19
vector19:
  pushl $0
  101be2:	6a 00                	push   $0x0
  pushl $19
  101be4:	6a 13                	push   $0x13
  jmp __alltraps
  101be6:	e9 3a ff ff ff       	jmp    101b25 <__alltraps>

00101beb <vector20>:
.globl vector20
vector20:
  pushl $0
  101beb:	6a 00                	push   $0x0
  pushl $20
  101bed:	6a 14                	push   $0x14
  jmp __alltraps
  101bef:	e9 31 ff ff ff       	jmp    101b25 <__alltraps>

00101bf4 <vector21>:
.globl vector21
vector21:
  pushl $0
  101bf4:	6a 00                	push   $0x0
  pushl $21
  101bf6:	6a 15                	push   $0x15
  jmp __alltraps
  101bf8:	e9 28 ff ff ff       	jmp    101b25 <__alltraps>

00101bfd <vector22>:
.globl vector22
vector22:
  pushl $0
  101bfd:	6a 00                	push   $0x0
  pushl $22
  101bff:	6a 16                	push   $0x16
  jmp __alltraps
  101c01:	e9 1f ff ff ff       	jmp    101b25 <__alltraps>

00101c06 <vector23>:
.globl vector23
vector23:
  pushl $0
  101c06:	6a 00                	push   $0x0
  pushl $23
  101c08:	6a 17                	push   $0x17
  jmp __alltraps
  101c0a:	e9 16 ff ff ff       	jmp    101b25 <__alltraps>

00101c0f <vector24>:
.globl vector24
vector24:
  pushl $0
  101c0f:	6a 00                	push   $0x0
  pushl $24
  101c11:	6a 18                	push   $0x18
  jmp __alltraps
  101c13:	e9 0d ff ff ff       	jmp    101b25 <__alltraps>

00101c18 <vector25>:
.globl vector25
vector25:
  pushl $0
  101c18:	6a 00                	push   $0x0
  pushl $25
  101c1a:	6a 19                	push   $0x19
  jmp __alltraps
  101c1c:	e9 04 ff ff ff       	jmp    101b25 <__alltraps>

00101c21 <vector26>:
.globl vector26
vector26:
  pushl $0
  101c21:	6a 00                	push   $0x0
  pushl $26
  101c23:	6a 1a                	push   $0x1a
  jmp __alltraps
  101c25:	e9 fb fe ff ff       	jmp    101b25 <__alltraps>

00101c2a <vector27>:
.globl vector27
vector27:
  pushl $0
  101c2a:	6a 00                	push   $0x0
  pushl $27
  101c2c:	6a 1b                	push   $0x1b
  jmp __alltraps
  101c2e:	e9 f2 fe ff ff       	jmp    101b25 <__alltraps>

00101c33 <vector28>:
.globl vector28
vector28:
  pushl $0
  101c33:	6a 00                	push   $0x0
  pushl $28
  101c35:	6a 1c                	push   $0x1c
  jmp __alltraps
  101c37:	e9 e9 fe ff ff       	jmp    101b25 <__alltraps>

00101c3c <vector29>:
.globl vector29
vector29:
  pushl $0
  101c3c:	6a 00                	push   $0x0
  pushl $29
  101c3e:	6a 1d                	push   $0x1d
  jmp __alltraps
  101c40:	e9 e0 fe ff ff       	jmp    101b25 <__alltraps>

00101c45 <vector30>:
.globl vector30
vector30:
  pushl $0
  101c45:	6a 00                	push   $0x0
  pushl $30
  101c47:	6a 1e                	push   $0x1e
  jmp __alltraps
  101c49:	e9 d7 fe ff ff       	jmp    101b25 <__alltraps>

00101c4e <vector31>:
.globl vector31
vector31:
  pushl $0
  101c4e:	6a 00                	push   $0x0
  pushl $31
  101c50:	6a 1f                	push   $0x1f
  jmp __alltraps
  101c52:	e9 ce fe ff ff       	jmp    101b25 <__alltraps>

00101c57 <vector32>:
.globl vector32
vector32:
  pushl $0
  101c57:	6a 00                	push   $0x0
  pushl $32
  101c59:	6a 20                	push   $0x20
  jmp __alltraps
  101c5b:	e9 c5 fe ff ff       	jmp    101b25 <__alltraps>

00101c60 <vector33>:
.globl vector33
vector33:
  pushl $0
  101c60:	6a 00                	push   $0x0
  pushl $33
  101c62:	6a 21                	push   $0x21
  jmp __alltraps
  101c64:	e9 bc fe ff ff       	jmp    101b25 <__alltraps>

00101c69 <vector34>:
.globl vector34
vector34:
  pushl $0
  101c69:	6a 00                	push   $0x0
  pushl $34
  101c6b:	6a 22                	push   $0x22
  jmp __alltraps
  101c6d:	e9 b3 fe ff ff       	jmp    101b25 <__alltraps>

00101c72 <vector35>:
.globl vector35
vector35:
  pushl $0
  101c72:	6a 00                	push   $0x0
  pushl $35
  101c74:	6a 23                	push   $0x23
  jmp __alltraps
  101c76:	e9 aa fe ff ff       	jmp    101b25 <__alltraps>

00101c7b <vector36>:
.globl vector36
vector36:
  pushl $0
  101c7b:	6a 00                	push   $0x0
  pushl $36
  101c7d:	6a 24                	push   $0x24
  jmp __alltraps
  101c7f:	e9 a1 fe ff ff       	jmp    101b25 <__alltraps>

00101c84 <vector37>:
.globl vector37
vector37:
  pushl $0
  101c84:	6a 00                	push   $0x0
  pushl $37
  101c86:	6a 25                	push   $0x25
  jmp __alltraps
  101c88:	e9 98 fe ff ff       	jmp    101b25 <__alltraps>

00101c8d <vector38>:
.globl vector38
vector38:
  pushl $0
  101c8d:	6a 00                	push   $0x0
  pushl $38
  101c8f:	6a 26                	push   $0x26
  jmp __alltraps
  101c91:	e9 8f fe ff ff       	jmp    101b25 <__alltraps>

00101c96 <vector39>:
.globl vector39
vector39:
  pushl $0
  101c96:	6a 00                	push   $0x0
  pushl $39
  101c98:	6a 27                	push   $0x27
  jmp __alltraps
  101c9a:	e9 86 fe ff ff       	jmp    101b25 <__alltraps>

00101c9f <vector40>:
.globl vector40
vector40:
  pushl $0
  101c9f:	6a 00                	push   $0x0
  pushl $40
  101ca1:	6a 28                	push   $0x28
  jmp __alltraps
  101ca3:	e9 7d fe ff ff       	jmp    101b25 <__alltraps>

00101ca8 <vector41>:
.globl vector41
vector41:
  pushl $0
  101ca8:	6a 00                	push   $0x0
  pushl $41
  101caa:	6a 29                	push   $0x29
  jmp __alltraps
  101cac:	e9 74 fe ff ff       	jmp    101b25 <__alltraps>

00101cb1 <vector42>:
.globl vector42
vector42:
  pushl $0
  101cb1:	6a 00                	push   $0x0
  pushl $42
  101cb3:	6a 2a                	push   $0x2a
  jmp __alltraps
  101cb5:	e9 6b fe ff ff       	jmp    101b25 <__alltraps>

00101cba <vector43>:
.globl vector43
vector43:
  pushl $0
  101cba:	6a 00                	push   $0x0
  pushl $43
  101cbc:	6a 2b                	push   $0x2b
  jmp __alltraps
  101cbe:	e9 62 fe ff ff       	jmp    101b25 <__alltraps>

00101cc3 <vector44>:
.globl vector44
vector44:
  pushl $0
  101cc3:	6a 00                	push   $0x0
  pushl $44
  101cc5:	6a 2c                	push   $0x2c
  jmp __alltraps
  101cc7:	e9 59 fe ff ff       	jmp    101b25 <__alltraps>

00101ccc <vector45>:
.globl vector45
vector45:
  pushl $0
  101ccc:	6a 00                	push   $0x0
  pushl $45
  101cce:	6a 2d                	push   $0x2d
  jmp __alltraps
  101cd0:	e9 50 fe ff ff       	jmp    101b25 <__alltraps>

00101cd5 <vector46>:
.globl vector46
vector46:
  pushl $0
  101cd5:	6a 00                	push   $0x0
  pushl $46
  101cd7:	6a 2e                	push   $0x2e
  jmp __alltraps
  101cd9:	e9 47 fe ff ff       	jmp    101b25 <__alltraps>

00101cde <vector47>:
.globl vector47
vector47:
  pushl $0
  101cde:	6a 00                	push   $0x0
  pushl $47
  101ce0:	6a 2f                	push   $0x2f
  jmp __alltraps
  101ce2:	e9 3e fe ff ff       	jmp    101b25 <__alltraps>

00101ce7 <vector48>:
.globl vector48
vector48:
  pushl $0
  101ce7:	6a 00                	push   $0x0
  pushl $48
  101ce9:	6a 30                	push   $0x30
  jmp __alltraps
  101ceb:	e9 35 fe ff ff       	jmp    101b25 <__alltraps>

00101cf0 <vector49>:
.globl vector49
vector49:
  pushl $0
  101cf0:	6a 00                	push   $0x0
  pushl $49
  101cf2:	6a 31                	push   $0x31
  jmp __alltraps
  101cf4:	e9 2c fe ff ff       	jmp    101b25 <__alltraps>

00101cf9 <vector50>:
.globl vector50
vector50:
  pushl $0
  101cf9:	6a 00                	push   $0x0
  pushl $50
  101cfb:	6a 32                	push   $0x32
  jmp __alltraps
  101cfd:	e9 23 fe ff ff       	jmp    101b25 <__alltraps>

00101d02 <vector51>:
.globl vector51
vector51:
  pushl $0
  101d02:	6a 00                	push   $0x0
  pushl $51
  101d04:	6a 33                	push   $0x33
  jmp __alltraps
  101d06:	e9 1a fe ff ff       	jmp    101b25 <__alltraps>

00101d0b <vector52>:
.globl vector52
vector52:
  pushl $0
  101d0b:	6a 00                	push   $0x0
  pushl $52
  101d0d:	6a 34                	push   $0x34
  jmp __alltraps
  101d0f:	e9 11 fe ff ff       	jmp    101b25 <__alltraps>

00101d14 <vector53>:
.globl vector53
vector53:
  pushl $0
  101d14:	6a 00                	push   $0x0
  pushl $53
  101d16:	6a 35                	push   $0x35
  jmp __alltraps
  101d18:	e9 08 fe ff ff       	jmp    101b25 <__alltraps>

00101d1d <vector54>:
.globl vector54
vector54:
  pushl $0
  101d1d:	6a 00                	push   $0x0
  pushl $54
  101d1f:	6a 36                	push   $0x36
  jmp __alltraps
  101d21:	e9 ff fd ff ff       	jmp    101b25 <__alltraps>

00101d26 <vector55>:
.globl vector55
vector55:
  pushl $0
  101d26:	6a 00                	push   $0x0
  pushl $55
  101d28:	6a 37                	push   $0x37
  jmp __alltraps
  101d2a:	e9 f6 fd ff ff       	jmp    101b25 <__alltraps>

00101d2f <vector56>:
.globl vector56
vector56:
  pushl $0
  101d2f:	6a 00                	push   $0x0
  pushl $56
  101d31:	6a 38                	push   $0x38
  jmp __alltraps
  101d33:	e9 ed fd ff ff       	jmp    101b25 <__alltraps>

00101d38 <vector57>:
.globl vector57
vector57:
  pushl $0
  101d38:	6a 00                	push   $0x0
  pushl $57
  101d3a:	6a 39                	push   $0x39
  jmp __alltraps
  101d3c:	e9 e4 fd ff ff       	jmp    101b25 <__alltraps>

00101d41 <vector58>:
.globl vector58
vector58:
  pushl $0
  101d41:	6a 00                	push   $0x0
  pushl $58
  101d43:	6a 3a                	push   $0x3a
  jmp __alltraps
  101d45:	e9 db fd ff ff       	jmp    101b25 <__alltraps>

00101d4a <vector59>:
.globl vector59
vector59:
  pushl $0
  101d4a:	6a 00                	push   $0x0
  pushl $59
  101d4c:	6a 3b                	push   $0x3b
  jmp __alltraps
  101d4e:	e9 d2 fd ff ff       	jmp    101b25 <__alltraps>

00101d53 <vector60>:
.globl vector60
vector60:
  pushl $0
  101d53:	6a 00                	push   $0x0
  pushl $60
  101d55:	6a 3c                	push   $0x3c
  jmp __alltraps
  101d57:	e9 c9 fd ff ff       	jmp    101b25 <__alltraps>

00101d5c <vector61>:
.globl vector61
vector61:
  pushl $0
  101d5c:	6a 00                	push   $0x0
  pushl $61
  101d5e:	6a 3d                	push   $0x3d
  jmp __alltraps
  101d60:	e9 c0 fd ff ff       	jmp    101b25 <__alltraps>

00101d65 <vector62>:
.globl vector62
vector62:
  pushl $0
  101d65:	6a 00                	push   $0x0
  pushl $62
  101d67:	6a 3e                	push   $0x3e
  jmp __alltraps
  101d69:	e9 b7 fd ff ff       	jmp    101b25 <__alltraps>

00101d6e <vector63>:
.globl vector63
vector63:
  pushl $0
  101d6e:	6a 00                	push   $0x0
  pushl $63
  101d70:	6a 3f                	push   $0x3f
  jmp __alltraps
  101d72:	e9 ae fd ff ff       	jmp    101b25 <__alltraps>

00101d77 <vector64>:
.globl vector64
vector64:
  pushl $0
  101d77:	6a 00                	push   $0x0
  pushl $64
  101d79:	6a 40                	push   $0x40
  jmp __alltraps
  101d7b:	e9 a5 fd ff ff       	jmp    101b25 <__alltraps>

00101d80 <vector65>:
.globl vector65
vector65:
  pushl $0
  101d80:	6a 00                	push   $0x0
  pushl $65
  101d82:	6a 41                	push   $0x41
  jmp __alltraps
  101d84:	e9 9c fd ff ff       	jmp    101b25 <__alltraps>

00101d89 <vector66>:
.globl vector66
vector66:
  pushl $0
  101d89:	6a 00                	push   $0x0
  pushl $66
  101d8b:	6a 42                	push   $0x42
  jmp __alltraps
  101d8d:	e9 93 fd ff ff       	jmp    101b25 <__alltraps>

00101d92 <vector67>:
.globl vector67
vector67:
  pushl $0
  101d92:	6a 00                	push   $0x0
  pushl $67
  101d94:	6a 43                	push   $0x43
  jmp __alltraps
  101d96:	e9 8a fd ff ff       	jmp    101b25 <__alltraps>

00101d9b <vector68>:
.globl vector68
vector68:
  pushl $0
  101d9b:	6a 00                	push   $0x0
  pushl $68
  101d9d:	6a 44                	push   $0x44
  jmp __alltraps
  101d9f:	e9 81 fd ff ff       	jmp    101b25 <__alltraps>

00101da4 <vector69>:
.globl vector69
vector69:
  pushl $0
  101da4:	6a 00                	push   $0x0
  pushl $69
  101da6:	6a 45                	push   $0x45
  jmp __alltraps
  101da8:	e9 78 fd ff ff       	jmp    101b25 <__alltraps>

00101dad <vector70>:
.globl vector70
vector70:
  pushl $0
  101dad:	6a 00                	push   $0x0
  pushl $70
  101daf:	6a 46                	push   $0x46
  jmp __alltraps
  101db1:	e9 6f fd ff ff       	jmp    101b25 <__alltraps>

00101db6 <vector71>:
.globl vector71
vector71:
  pushl $0
  101db6:	6a 00                	push   $0x0
  pushl $71
  101db8:	6a 47                	push   $0x47
  jmp __alltraps
  101dba:	e9 66 fd ff ff       	jmp    101b25 <__alltraps>

00101dbf <vector72>:
.globl vector72
vector72:
  pushl $0
  101dbf:	6a 00                	push   $0x0
  pushl $72
  101dc1:	6a 48                	push   $0x48
  jmp __alltraps
  101dc3:	e9 5d fd ff ff       	jmp    101b25 <__alltraps>

00101dc8 <vector73>:
.globl vector73
vector73:
  pushl $0
  101dc8:	6a 00                	push   $0x0
  pushl $73
  101dca:	6a 49                	push   $0x49
  jmp __alltraps
  101dcc:	e9 54 fd ff ff       	jmp    101b25 <__alltraps>

00101dd1 <vector74>:
.globl vector74
vector74:
  pushl $0
  101dd1:	6a 00                	push   $0x0
  pushl $74
  101dd3:	6a 4a                	push   $0x4a
  jmp __alltraps
  101dd5:	e9 4b fd ff ff       	jmp    101b25 <__alltraps>

00101dda <vector75>:
.globl vector75
vector75:
  pushl $0
  101dda:	6a 00                	push   $0x0
  pushl $75
  101ddc:	6a 4b                	push   $0x4b
  jmp __alltraps
  101dde:	e9 42 fd ff ff       	jmp    101b25 <__alltraps>

00101de3 <vector76>:
.globl vector76
vector76:
  pushl $0
  101de3:	6a 00                	push   $0x0
  pushl $76
  101de5:	6a 4c                	push   $0x4c
  jmp __alltraps
  101de7:	e9 39 fd ff ff       	jmp    101b25 <__alltraps>

00101dec <vector77>:
.globl vector77
vector77:
  pushl $0
  101dec:	6a 00                	push   $0x0
  pushl $77
  101dee:	6a 4d                	push   $0x4d
  jmp __alltraps
  101df0:	e9 30 fd ff ff       	jmp    101b25 <__alltraps>

00101df5 <vector78>:
.globl vector78
vector78:
  pushl $0
  101df5:	6a 00                	push   $0x0
  pushl $78
  101df7:	6a 4e                	push   $0x4e
  jmp __alltraps
  101df9:	e9 27 fd ff ff       	jmp    101b25 <__alltraps>

00101dfe <vector79>:
.globl vector79
vector79:
  pushl $0
  101dfe:	6a 00                	push   $0x0
  pushl $79
  101e00:	6a 4f                	push   $0x4f
  jmp __alltraps
  101e02:	e9 1e fd ff ff       	jmp    101b25 <__alltraps>

00101e07 <vector80>:
.globl vector80
vector80:
  pushl $0
  101e07:	6a 00                	push   $0x0
  pushl $80
  101e09:	6a 50                	push   $0x50
  jmp __alltraps
  101e0b:	e9 15 fd ff ff       	jmp    101b25 <__alltraps>

00101e10 <vector81>:
.globl vector81
vector81:
  pushl $0
  101e10:	6a 00                	push   $0x0
  pushl $81
  101e12:	6a 51                	push   $0x51
  jmp __alltraps
  101e14:	e9 0c fd ff ff       	jmp    101b25 <__alltraps>

00101e19 <vector82>:
.globl vector82
vector82:
  pushl $0
  101e19:	6a 00                	push   $0x0
  pushl $82
  101e1b:	6a 52                	push   $0x52
  jmp __alltraps
  101e1d:	e9 03 fd ff ff       	jmp    101b25 <__alltraps>

00101e22 <vector83>:
.globl vector83
vector83:
  pushl $0
  101e22:	6a 00                	push   $0x0
  pushl $83
  101e24:	6a 53                	push   $0x53
  jmp __alltraps
  101e26:	e9 fa fc ff ff       	jmp    101b25 <__alltraps>

00101e2b <vector84>:
.globl vector84
vector84:
  pushl $0
  101e2b:	6a 00                	push   $0x0
  pushl $84
  101e2d:	6a 54                	push   $0x54
  jmp __alltraps
  101e2f:	e9 f1 fc ff ff       	jmp    101b25 <__alltraps>

00101e34 <vector85>:
.globl vector85
vector85:
  pushl $0
  101e34:	6a 00                	push   $0x0
  pushl $85
  101e36:	6a 55                	push   $0x55
  jmp __alltraps
  101e38:	e9 e8 fc ff ff       	jmp    101b25 <__alltraps>

00101e3d <vector86>:
.globl vector86
vector86:
  pushl $0
  101e3d:	6a 00                	push   $0x0
  pushl $86
  101e3f:	6a 56                	push   $0x56
  jmp __alltraps
  101e41:	e9 df fc ff ff       	jmp    101b25 <__alltraps>

00101e46 <vector87>:
.globl vector87
vector87:
  pushl $0
  101e46:	6a 00                	push   $0x0
  pushl $87
  101e48:	6a 57                	push   $0x57
  jmp __alltraps
  101e4a:	e9 d6 fc ff ff       	jmp    101b25 <__alltraps>

00101e4f <vector88>:
.globl vector88
vector88:
  pushl $0
  101e4f:	6a 00                	push   $0x0
  pushl $88
  101e51:	6a 58                	push   $0x58
  jmp __alltraps
  101e53:	e9 cd fc ff ff       	jmp    101b25 <__alltraps>

00101e58 <vector89>:
.globl vector89
vector89:
  pushl $0
  101e58:	6a 00                	push   $0x0
  pushl $89
  101e5a:	6a 59                	push   $0x59
  jmp __alltraps
  101e5c:	e9 c4 fc ff ff       	jmp    101b25 <__alltraps>

00101e61 <vector90>:
.globl vector90
vector90:
  pushl $0
  101e61:	6a 00                	push   $0x0
  pushl $90
  101e63:	6a 5a                	push   $0x5a
  jmp __alltraps
  101e65:	e9 bb fc ff ff       	jmp    101b25 <__alltraps>

00101e6a <vector91>:
.globl vector91
vector91:
  pushl $0
  101e6a:	6a 00                	push   $0x0
  pushl $91
  101e6c:	6a 5b                	push   $0x5b
  jmp __alltraps
  101e6e:	e9 b2 fc ff ff       	jmp    101b25 <__alltraps>

00101e73 <vector92>:
.globl vector92
vector92:
  pushl $0
  101e73:	6a 00                	push   $0x0
  pushl $92
  101e75:	6a 5c                	push   $0x5c
  jmp __alltraps
  101e77:	e9 a9 fc ff ff       	jmp    101b25 <__alltraps>

00101e7c <vector93>:
.globl vector93
vector93:
  pushl $0
  101e7c:	6a 00                	push   $0x0
  pushl $93
  101e7e:	6a 5d                	push   $0x5d
  jmp __alltraps
  101e80:	e9 a0 fc ff ff       	jmp    101b25 <__alltraps>

00101e85 <vector94>:
.globl vector94
vector94:
  pushl $0
  101e85:	6a 00                	push   $0x0
  pushl $94
  101e87:	6a 5e                	push   $0x5e
  jmp __alltraps
  101e89:	e9 97 fc ff ff       	jmp    101b25 <__alltraps>

00101e8e <vector95>:
.globl vector95
vector95:
  pushl $0
  101e8e:	6a 00                	push   $0x0
  pushl $95
  101e90:	6a 5f                	push   $0x5f
  jmp __alltraps
  101e92:	e9 8e fc ff ff       	jmp    101b25 <__alltraps>

00101e97 <vector96>:
.globl vector96
vector96:
  pushl $0
  101e97:	6a 00                	push   $0x0
  pushl $96
  101e99:	6a 60                	push   $0x60
  jmp __alltraps
  101e9b:	e9 85 fc ff ff       	jmp    101b25 <__alltraps>

00101ea0 <vector97>:
.globl vector97
vector97:
  pushl $0
  101ea0:	6a 00                	push   $0x0
  pushl $97
  101ea2:	6a 61                	push   $0x61
  jmp __alltraps
  101ea4:	e9 7c fc ff ff       	jmp    101b25 <__alltraps>

00101ea9 <vector98>:
.globl vector98
vector98:
  pushl $0
  101ea9:	6a 00                	push   $0x0
  pushl $98
  101eab:	6a 62                	push   $0x62
  jmp __alltraps
  101ead:	e9 73 fc ff ff       	jmp    101b25 <__alltraps>

00101eb2 <vector99>:
.globl vector99
vector99:
  pushl $0
  101eb2:	6a 00                	push   $0x0
  pushl $99
  101eb4:	6a 63                	push   $0x63
  jmp __alltraps
  101eb6:	e9 6a fc ff ff       	jmp    101b25 <__alltraps>

00101ebb <vector100>:
.globl vector100
vector100:
  pushl $0
  101ebb:	6a 00                	push   $0x0
  pushl $100
  101ebd:	6a 64                	push   $0x64
  jmp __alltraps
  101ebf:	e9 61 fc ff ff       	jmp    101b25 <__alltraps>

00101ec4 <vector101>:
.globl vector101
vector101:
  pushl $0
  101ec4:	6a 00                	push   $0x0
  pushl $101
  101ec6:	6a 65                	push   $0x65
  jmp __alltraps
  101ec8:	e9 58 fc ff ff       	jmp    101b25 <__alltraps>

00101ecd <vector102>:
.globl vector102
vector102:
  pushl $0
  101ecd:	6a 00                	push   $0x0
  pushl $102
  101ecf:	6a 66                	push   $0x66
  jmp __alltraps
  101ed1:	e9 4f fc ff ff       	jmp    101b25 <__alltraps>

00101ed6 <vector103>:
.globl vector103
vector103:
  pushl $0
  101ed6:	6a 00                	push   $0x0
  pushl $103
  101ed8:	6a 67                	push   $0x67
  jmp __alltraps
  101eda:	e9 46 fc ff ff       	jmp    101b25 <__alltraps>

00101edf <vector104>:
.globl vector104
vector104:
  pushl $0
  101edf:	6a 00                	push   $0x0
  pushl $104
  101ee1:	6a 68                	push   $0x68
  jmp __alltraps
  101ee3:	e9 3d fc ff ff       	jmp    101b25 <__alltraps>

00101ee8 <vector105>:
.globl vector105
vector105:
  pushl $0
  101ee8:	6a 00                	push   $0x0
  pushl $105
  101eea:	6a 69                	push   $0x69
  jmp __alltraps
  101eec:	e9 34 fc ff ff       	jmp    101b25 <__alltraps>

00101ef1 <vector106>:
.globl vector106
vector106:
  pushl $0
  101ef1:	6a 00                	push   $0x0
  pushl $106
  101ef3:	6a 6a                	push   $0x6a
  jmp __alltraps
  101ef5:	e9 2b fc ff ff       	jmp    101b25 <__alltraps>

00101efa <vector107>:
.globl vector107
vector107:
  pushl $0
  101efa:	6a 00                	push   $0x0
  pushl $107
  101efc:	6a 6b                	push   $0x6b
  jmp __alltraps
  101efe:	e9 22 fc ff ff       	jmp    101b25 <__alltraps>

00101f03 <vector108>:
.globl vector108
vector108:
  pushl $0
  101f03:	6a 00                	push   $0x0
  pushl $108
  101f05:	6a 6c                	push   $0x6c
  jmp __alltraps
  101f07:	e9 19 fc ff ff       	jmp    101b25 <__alltraps>

00101f0c <vector109>:
.globl vector109
vector109:
  pushl $0
  101f0c:	6a 00                	push   $0x0
  pushl $109
  101f0e:	6a 6d                	push   $0x6d
  jmp __alltraps
  101f10:	e9 10 fc ff ff       	jmp    101b25 <__alltraps>

00101f15 <vector110>:
.globl vector110
vector110:
  pushl $0
  101f15:	6a 00                	push   $0x0
  pushl $110
  101f17:	6a 6e                	push   $0x6e
  jmp __alltraps
  101f19:	e9 07 fc ff ff       	jmp    101b25 <__alltraps>

00101f1e <vector111>:
.globl vector111
vector111:
  pushl $0
  101f1e:	6a 00                	push   $0x0
  pushl $111
  101f20:	6a 6f                	push   $0x6f
  jmp __alltraps
  101f22:	e9 fe fb ff ff       	jmp    101b25 <__alltraps>

00101f27 <vector112>:
.globl vector112
vector112:
  pushl $0
  101f27:	6a 00                	push   $0x0
  pushl $112
  101f29:	6a 70                	push   $0x70
  jmp __alltraps
  101f2b:	e9 f5 fb ff ff       	jmp    101b25 <__alltraps>

00101f30 <vector113>:
.globl vector113
vector113:
  pushl $0
  101f30:	6a 00                	push   $0x0
  pushl $113
  101f32:	6a 71                	push   $0x71
  jmp __alltraps
  101f34:	e9 ec fb ff ff       	jmp    101b25 <__alltraps>

00101f39 <vector114>:
.globl vector114
vector114:
  pushl $0
  101f39:	6a 00                	push   $0x0
  pushl $114
  101f3b:	6a 72                	push   $0x72
  jmp __alltraps
  101f3d:	e9 e3 fb ff ff       	jmp    101b25 <__alltraps>

00101f42 <vector115>:
.globl vector115
vector115:
  pushl $0
  101f42:	6a 00                	push   $0x0
  pushl $115
  101f44:	6a 73                	push   $0x73
  jmp __alltraps
  101f46:	e9 da fb ff ff       	jmp    101b25 <__alltraps>

00101f4b <vector116>:
.globl vector116
vector116:
  pushl $0
  101f4b:	6a 00                	push   $0x0
  pushl $116
  101f4d:	6a 74                	push   $0x74
  jmp __alltraps
  101f4f:	e9 d1 fb ff ff       	jmp    101b25 <__alltraps>

00101f54 <vector117>:
.globl vector117
vector117:
  pushl $0
  101f54:	6a 00                	push   $0x0
  pushl $117
  101f56:	6a 75                	push   $0x75
  jmp __alltraps
  101f58:	e9 c8 fb ff ff       	jmp    101b25 <__alltraps>

00101f5d <vector118>:
.globl vector118
vector118:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $118
  101f5f:	6a 76                	push   $0x76
  jmp __alltraps
  101f61:	e9 bf fb ff ff       	jmp    101b25 <__alltraps>

00101f66 <vector119>:
.globl vector119
vector119:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $119
  101f68:	6a 77                	push   $0x77
  jmp __alltraps
  101f6a:	e9 b6 fb ff ff       	jmp    101b25 <__alltraps>

00101f6f <vector120>:
.globl vector120
vector120:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $120
  101f71:	6a 78                	push   $0x78
  jmp __alltraps
  101f73:	e9 ad fb ff ff       	jmp    101b25 <__alltraps>

00101f78 <vector121>:
.globl vector121
vector121:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $121
  101f7a:	6a 79                	push   $0x79
  jmp __alltraps
  101f7c:	e9 a4 fb ff ff       	jmp    101b25 <__alltraps>

00101f81 <vector122>:
.globl vector122
vector122:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $122
  101f83:	6a 7a                	push   $0x7a
  jmp __alltraps
  101f85:	e9 9b fb ff ff       	jmp    101b25 <__alltraps>

00101f8a <vector123>:
.globl vector123
vector123:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $123
  101f8c:	6a 7b                	push   $0x7b
  jmp __alltraps
  101f8e:	e9 92 fb ff ff       	jmp    101b25 <__alltraps>

00101f93 <vector124>:
.globl vector124
vector124:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $124
  101f95:	6a 7c                	push   $0x7c
  jmp __alltraps
  101f97:	e9 89 fb ff ff       	jmp    101b25 <__alltraps>

00101f9c <vector125>:
.globl vector125
vector125:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $125
  101f9e:	6a 7d                	push   $0x7d
  jmp __alltraps
  101fa0:	e9 80 fb ff ff       	jmp    101b25 <__alltraps>

00101fa5 <vector126>:
.globl vector126
vector126:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $126
  101fa7:	6a 7e                	push   $0x7e
  jmp __alltraps
  101fa9:	e9 77 fb ff ff       	jmp    101b25 <__alltraps>

00101fae <vector127>:
.globl vector127
vector127:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $127
  101fb0:	6a 7f                	push   $0x7f
  jmp __alltraps
  101fb2:	e9 6e fb ff ff       	jmp    101b25 <__alltraps>

00101fb7 <vector128>:
.globl vector128
vector128:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $128
  101fb9:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  101fbe:	e9 62 fb ff ff       	jmp    101b25 <__alltraps>

00101fc3 <vector129>:
.globl vector129
vector129:
  pushl $0
  101fc3:	6a 00                	push   $0x0
  pushl $129
  101fc5:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  101fca:	e9 56 fb ff ff       	jmp    101b25 <__alltraps>

00101fcf <vector130>:
.globl vector130
vector130:
  pushl $0
  101fcf:	6a 00                	push   $0x0
  pushl $130
  101fd1:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  101fd6:	e9 4a fb ff ff       	jmp    101b25 <__alltraps>

00101fdb <vector131>:
.globl vector131
vector131:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $131
  101fdd:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  101fe2:	e9 3e fb ff ff       	jmp    101b25 <__alltraps>

00101fe7 <vector132>:
.globl vector132
vector132:
  pushl $0
  101fe7:	6a 00                	push   $0x0
  pushl $132
  101fe9:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  101fee:	e9 32 fb ff ff       	jmp    101b25 <__alltraps>

00101ff3 <vector133>:
.globl vector133
vector133:
  pushl $0
  101ff3:	6a 00                	push   $0x0
  pushl $133
  101ff5:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  101ffa:	e9 26 fb ff ff       	jmp    101b25 <__alltraps>

00101fff <vector134>:
.globl vector134
vector134:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $134
  102001:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102006:	e9 1a fb ff ff       	jmp    101b25 <__alltraps>

0010200b <vector135>:
.globl vector135
vector135:
  pushl $0
  10200b:	6a 00                	push   $0x0
  pushl $135
  10200d:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102012:	e9 0e fb ff ff       	jmp    101b25 <__alltraps>

00102017 <vector136>:
.globl vector136
vector136:
  pushl $0
  102017:	6a 00                	push   $0x0
  pushl $136
  102019:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10201e:	e9 02 fb ff ff       	jmp    101b25 <__alltraps>

00102023 <vector137>:
.globl vector137
vector137:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $137
  102025:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  10202a:	e9 f6 fa ff ff       	jmp    101b25 <__alltraps>

0010202f <vector138>:
.globl vector138
vector138:
  pushl $0
  10202f:	6a 00                	push   $0x0
  pushl $138
  102031:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102036:	e9 ea fa ff ff       	jmp    101b25 <__alltraps>

0010203b <vector139>:
.globl vector139
vector139:
  pushl $0
  10203b:	6a 00                	push   $0x0
  pushl $139
  10203d:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102042:	e9 de fa ff ff       	jmp    101b25 <__alltraps>

00102047 <vector140>:
.globl vector140
vector140:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $140
  102049:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10204e:	e9 d2 fa ff ff       	jmp    101b25 <__alltraps>

00102053 <vector141>:
.globl vector141
vector141:
  pushl $0
  102053:	6a 00                	push   $0x0
  pushl $141
  102055:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  10205a:	e9 c6 fa ff ff       	jmp    101b25 <__alltraps>

0010205f <vector142>:
.globl vector142
vector142:
  pushl $0
  10205f:	6a 00                	push   $0x0
  pushl $142
  102061:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102066:	e9 ba fa ff ff       	jmp    101b25 <__alltraps>

0010206b <vector143>:
.globl vector143
vector143:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $143
  10206d:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102072:	e9 ae fa ff ff       	jmp    101b25 <__alltraps>

00102077 <vector144>:
.globl vector144
vector144:
  pushl $0
  102077:	6a 00                	push   $0x0
  pushl $144
  102079:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10207e:	e9 a2 fa ff ff       	jmp    101b25 <__alltraps>

00102083 <vector145>:
.globl vector145
vector145:
  pushl $0
  102083:	6a 00                	push   $0x0
  pushl $145
  102085:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10208a:	e9 96 fa ff ff       	jmp    101b25 <__alltraps>

0010208f <vector146>:
.globl vector146
vector146:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $146
  102091:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102096:	e9 8a fa ff ff       	jmp    101b25 <__alltraps>

0010209b <vector147>:
.globl vector147
vector147:
  pushl $0
  10209b:	6a 00                	push   $0x0
  pushl $147
  10209d:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1020a2:	e9 7e fa ff ff       	jmp    101b25 <__alltraps>

001020a7 <vector148>:
.globl vector148
vector148:
  pushl $0
  1020a7:	6a 00                	push   $0x0
  pushl $148
  1020a9:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1020ae:	e9 72 fa ff ff       	jmp    101b25 <__alltraps>

001020b3 <vector149>:
.globl vector149
vector149:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $149
  1020b5:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1020ba:	e9 66 fa ff ff       	jmp    101b25 <__alltraps>

001020bf <vector150>:
.globl vector150
vector150:
  pushl $0
  1020bf:	6a 00                	push   $0x0
  pushl $150
  1020c1:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1020c6:	e9 5a fa ff ff       	jmp    101b25 <__alltraps>

001020cb <vector151>:
.globl vector151
vector151:
  pushl $0
  1020cb:	6a 00                	push   $0x0
  pushl $151
  1020cd:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1020d2:	e9 4e fa ff ff       	jmp    101b25 <__alltraps>

001020d7 <vector152>:
.globl vector152
vector152:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $152
  1020d9:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1020de:	e9 42 fa ff ff       	jmp    101b25 <__alltraps>

001020e3 <vector153>:
.globl vector153
vector153:
  pushl $0
  1020e3:	6a 00                	push   $0x0
  pushl $153
  1020e5:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1020ea:	e9 36 fa ff ff       	jmp    101b25 <__alltraps>

001020ef <vector154>:
.globl vector154
vector154:
  pushl $0
  1020ef:	6a 00                	push   $0x0
  pushl $154
  1020f1:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1020f6:	e9 2a fa ff ff       	jmp    101b25 <__alltraps>

001020fb <vector155>:
.globl vector155
vector155:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $155
  1020fd:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102102:	e9 1e fa ff ff       	jmp    101b25 <__alltraps>

00102107 <vector156>:
.globl vector156
vector156:
  pushl $0
  102107:	6a 00                	push   $0x0
  pushl $156
  102109:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10210e:	e9 12 fa ff ff       	jmp    101b25 <__alltraps>

00102113 <vector157>:
.globl vector157
vector157:
  pushl $0
  102113:	6a 00                	push   $0x0
  pushl $157
  102115:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  10211a:	e9 06 fa ff ff       	jmp    101b25 <__alltraps>

0010211f <vector158>:
.globl vector158
vector158:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $158
  102121:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102126:	e9 fa f9 ff ff       	jmp    101b25 <__alltraps>

0010212b <vector159>:
.globl vector159
vector159:
  pushl $0
  10212b:	6a 00                	push   $0x0
  pushl $159
  10212d:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102132:	e9 ee f9 ff ff       	jmp    101b25 <__alltraps>

00102137 <vector160>:
.globl vector160
vector160:
  pushl $0
  102137:	6a 00                	push   $0x0
  pushl $160
  102139:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10213e:	e9 e2 f9 ff ff       	jmp    101b25 <__alltraps>

00102143 <vector161>:
.globl vector161
vector161:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $161
  102145:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  10214a:	e9 d6 f9 ff ff       	jmp    101b25 <__alltraps>

0010214f <vector162>:
.globl vector162
vector162:
  pushl $0
  10214f:	6a 00                	push   $0x0
  pushl $162
  102151:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102156:	e9 ca f9 ff ff       	jmp    101b25 <__alltraps>

0010215b <vector163>:
.globl vector163
vector163:
  pushl $0
  10215b:	6a 00                	push   $0x0
  pushl $163
  10215d:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102162:	e9 be f9 ff ff       	jmp    101b25 <__alltraps>

00102167 <vector164>:
.globl vector164
vector164:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $164
  102169:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10216e:	e9 b2 f9 ff ff       	jmp    101b25 <__alltraps>

00102173 <vector165>:
.globl vector165
vector165:
  pushl $0
  102173:	6a 00                	push   $0x0
  pushl $165
  102175:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10217a:	e9 a6 f9 ff ff       	jmp    101b25 <__alltraps>

0010217f <vector166>:
.globl vector166
vector166:
  pushl $0
  10217f:	6a 00                	push   $0x0
  pushl $166
  102181:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102186:	e9 9a f9 ff ff       	jmp    101b25 <__alltraps>

0010218b <vector167>:
.globl vector167
vector167:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $167
  10218d:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102192:	e9 8e f9 ff ff       	jmp    101b25 <__alltraps>

00102197 <vector168>:
.globl vector168
vector168:
  pushl $0
  102197:	6a 00                	push   $0x0
  pushl $168
  102199:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10219e:	e9 82 f9 ff ff       	jmp    101b25 <__alltraps>

001021a3 <vector169>:
.globl vector169
vector169:
  pushl $0
  1021a3:	6a 00                	push   $0x0
  pushl $169
  1021a5:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1021aa:	e9 76 f9 ff ff       	jmp    101b25 <__alltraps>

001021af <vector170>:
.globl vector170
vector170:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $170
  1021b1:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1021b6:	e9 6a f9 ff ff       	jmp    101b25 <__alltraps>

001021bb <vector171>:
.globl vector171
vector171:
  pushl $0
  1021bb:	6a 00                	push   $0x0
  pushl $171
  1021bd:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1021c2:	e9 5e f9 ff ff       	jmp    101b25 <__alltraps>

001021c7 <vector172>:
.globl vector172
vector172:
  pushl $0
  1021c7:	6a 00                	push   $0x0
  pushl $172
  1021c9:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1021ce:	e9 52 f9 ff ff       	jmp    101b25 <__alltraps>

001021d3 <vector173>:
.globl vector173
vector173:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $173
  1021d5:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1021da:	e9 46 f9 ff ff       	jmp    101b25 <__alltraps>

001021df <vector174>:
.globl vector174
vector174:
  pushl $0
  1021df:	6a 00                	push   $0x0
  pushl $174
  1021e1:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1021e6:	e9 3a f9 ff ff       	jmp    101b25 <__alltraps>

001021eb <vector175>:
.globl vector175
vector175:
  pushl $0
  1021eb:	6a 00                	push   $0x0
  pushl $175
  1021ed:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1021f2:	e9 2e f9 ff ff       	jmp    101b25 <__alltraps>

001021f7 <vector176>:
.globl vector176
vector176:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $176
  1021f9:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1021fe:	e9 22 f9 ff ff       	jmp    101b25 <__alltraps>

00102203 <vector177>:
.globl vector177
vector177:
  pushl $0
  102203:	6a 00                	push   $0x0
  pushl $177
  102205:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  10220a:	e9 16 f9 ff ff       	jmp    101b25 <__alltraps>

0010220f <vector178>:
.globl vector178
vector178:
  pushl $0
  10220f:	6a 00                	push   $0x0
  pushl $178
  102211:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102216:	e9 0a f9 ff ff       	jmp    101b25 <__alltraps>

0010221b <vector179>:
.globl vector179
vector179:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $179
  10221d:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102222:	e9 fe f8 ff ff       	jmp    101b25 <__alltraps>

00102227 <vector180>:
.globl vector180
vector180:
  pushl $0
  102227:	6a 00                	push   $0x0
  pushl $180
  102229:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10222e:	e9 f2 f8 ff ff       	jmp    101b25 <__alltraps>

00102233 <vector181>:
.globl vector181
vector181:
  pushl $0
  102233:	6a 00                	push   $0x0
  pushl $181
  102235:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  10223a:	e9 e6 f8 ff ff       	jmp    101b25 <__alltraps>

0010223f <vector182>:
.globl vector182
vector182:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $182
  102241:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102246:	e9 da f8 ff ff       	jmp    101b25 <__alltraps>

0010224b <vector183>:
.globl vector183
vector183:
  pushl $0
  10224b:	6a 00                	push   $0x0
  pushl $183
  10224d:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102252:	e9 ce f8 ff ff       	jmp    101b25 <__alltraps>

00102257 <vector184>:
.globl vector184
vector184:
  pushl $0
  102257:	6a 00                	push   $0x0
  pushl $184
  102259:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10225e:	e9 c2 f8 ff ff       	jmp    101b25 <__alltraps>

00102263 <vector185>:
.globl vector185
vector185:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $185
  102265:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10226a:	e9 b6 f8 ff ff       	jmp    101b25 <__alltraps>

0010226f <vector186>:
.globl vector186
vector186:
  pushl $0
  10226f:	6a 00                	push   $0x0
  pushl $186
  102271:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102276:	e9 aa f8 ff ff       	jmp    101b25 <__alltraps>

0010227b <vector187>:
.globl vector187
vector187:
  pushl $0
  10227b:	6a 00                	push   $0x0
  pushl $187
  10227d:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102282:	e9 9e f8 ff ff       	jmp    101b25 <__alltraps>

00102287 <vector188>:
.globl vector188
vector188:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $188
  102289:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10228e:	e9 92 f8 ff ff       	jmp    101b25 <__alltraps>

00102293 <vector189>:
.globl vector189
vector189:
  pushl $0
  102293:	6a 00                	push   $0x0
  pushl $189
  102295:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10229a:	e9 86 f8 ff ff       	jmp    101b25 <__alltraps>

0010229f <vector190>:
.globl vector190
vector190:
  pushl $0
  10229f:	6a 00                	push   $0x0
  pushl $190
  1022a1:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1022a6:	e9 7a f8 ff ff       	jmp    101b25 <__alltraps>

001022ab <vector191>:
.globl vector191
vector191:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $191
  1022ad:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1022b2:	e9 6e f8 ff ff       	jmp    101b25 <__alltraps>

001022b7 <vector192>:
.globl vector192
vector192:
  pushl $0
  1022b7:	6a 00                	push   $0x0
  pushl $192
  1022b9:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1022be:	e9 62 f8 ff ff       	jmp    101b25 <__alltraps>

001022c3 <vector193>:
.globl vector193
vector193:
  pushl $0
  1022c3:	6a 00                	push   $0x0
  pushl $193
  1022c5:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1022ca:	e9 56 f8 ff ff       	jmp    101b25 <__alltraps>

001022cf <vector194>:
.globl vector194
vector194:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $194
  1022d1:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1022d6:	e9 4a f8 ff ff       	jmp    101b25 <__alltraps>

001022db <vector195>:
.globl vector195
vector195:
  pushl $0
  1022db:	6a 00                	push   $0x0
  pushl $195
  1022dd:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1022e2:	e9 3e f8 ff ff       	jmp    101b25 <__alltraps>

001022e7 <vector196>:
.globl vector196
vector196:
  pushl $0
  1022e7:	6a 00                	push   $0x0
  pushl $196
  1022e9:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1022ee:	e9 32 f8 ff ff       	jmp    101b25 <__alltraps>

001022f3 <vector197>:
.globl vector197
vector197:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $197
  1022f5:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1022fa:	e9 26 f8 ff ff       	jmp    101b25 <__alltraps>

001022ff <vector198>:
.globl vector198
vector198:
  pushl $0
  1022ff:	6a 00                	push   $0x0
  pushl $198
  102301:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102306:	e9 1a f8 ff ff       	jmp    101b25 <__alltraps>

0010230b <vector199>:
.globl vector199
vector199:
  pushl $0
  10230b:	6a 00                	push   $0x0
  pushl $199
  10230d:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102312:	e9 0e f8 ff ff       	jmp    101b25 <__alltraps>

00102317 <vector200>:
.globl vector200
vector200:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $200
  102319:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10231e:	e9 02 f8 ff ff       	jmp    101b25 <__alltraps>

00102323 <vector201>:
.globl vector201
vector201:
  pushl $0
  102323:	6a 00                	push   $0x0
  pushl $201
  102325:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  10232a:	e9 f6 f7 ff ff       	jmp    101b25 <__alltraps>

0010232f <vector202>:
.globl vector202
vector202:
  pushl $0
  10232f:	6a 00                	push   $0x0
  pushl $202
  102331:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102336:	e9 ea f7 ff ff       	jmp    101b25 <__alltraps>

0010233b <vector203>:
.globl vector203
vector203:
  pushl $0
  10233b:	6a 00                	push   $0x0
  pushl $203
  10233d:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102342:	e9 de f7 ff ff       	jmp    101b25 <__alltraps>

00102347 <vector204>:
.globl vector204
vector204:
  pushl $0
  102347:	6a 00                	push   $0x0
  pushl $204
  102349:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10234e:	e9 d2 f7 ff ff       	jmp    101b25 <__alltraps>

00102353 <vector205>:
.globl vector205
vector205:
  pushl $0
  102353:	6a 00                	push   $0x0
  pushl $205
  102355:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  10235a:	e9 c6 f7 ff ff       	jmp    101b25 <__alltraps>

0010235f <vector206>:
.globl vector206
vector206:
  pushl $0
  10235f:	6a 00                	push   $0x0
  pushl $206
  102361:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102366:	e9 ba f7 ff ff       	jmp    101b25 <__alltraps>

0010236b <vector207>:
.globl vector207
vector207:
  pushl $0
  10236b:	6a 00                	push   $0x0
  pushl $207
  10236d:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102372:	e9 ae f7 ff ff       	jmp    101b25 <__alltraps>

00102377 <vector208>:
.globl vector208
vector208:
  pushl $0
  102377:	6a 00                	push   $0x0
  pushl $208
  102379:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10237e:	e9 a2 f7 ff ff       	jmp    101b25 <__alltraps>

00102383 <vector209>:
.globl vector209
vector209:
  pushl $0
  102383:	6a 00                	push   $0x0
  pushl $209
  102385:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10238a:	e9 96 f7 ff ff       	jmp    101b25 <__alltraps>

0010238f <vector210>:
.globl vector210
vector210:
  pushl $0
  10238f:	6a 00                	push   $0x0
  pushl $210
  102391:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102396:	e9 8a f7 ff ff       	jmp    101b25 <__alltraps>

0010239b <vector211>:
.globl vector211
vector211:
  pushl $0
  10239b:	6a 00                	push   $0x0
  pushl $211
  10239d:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1023a2:	e9 7e f7 ff ff       	jmp    101b25 <__alltraps>

001023a7 <vector212>:
.globl vector212
vector212:
  pushl $0
  1023a7:	6a 00                	push   $0x0
  pushl $212
  1023a9:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1023ae:	e9 72 f7 ff ff       	jmp    101b25 <__alltraps>

001023b3 <vector213>:
.globl vector213
vector213:
  pushl $0
  1023b3:	6a 00                	push   $0x0
  pushl $213
  1023b5:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1023ba:	e9 66 f7 ff ff       	jmp    101b25 <__alltraps>

001023bf <vector214>:
.globl vector214
vector214:
  pushl $0
  1023bf:	6a 00                	push   $0x0
  pushl $214
  1023c1:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1023c6:	e9 5a f7 ff ff       	jmp    101b25 <__alltraps>

001023cb <vector215>:
.globl vector215
vector215:
  pushl $0
  1023cb:	6a 00                	push   $0x0
  pushl $215
  1023cd:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1023d2:	e9 4e f7 ff ff       	jmp    101b25 <__alltraps>

001023d7 <vector216>:
.globl vector216
vector216:
  pushl $0
  1023d7:	6a 00                	push   $0x0
  pushl $216
  1023d9:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1023de:	e9 42 f7 ff ff       	jmp    101b25 <__alltraps>

001023e3 <vector217>:
.globl vector217
vector217:
  pushl $0
  1023e3:	6a 00                	push   $0x0
  pushl $217
  1023e5:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1023ea:	e9 36 f7 ff ff       	jmp    101b25 <__alltraps>

001023ef <vector218>:
.globl vector218
vector218:
  pushl $0
  1023ef:	6a 00                	push   $0x0
  pushl $218
  1023f1:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1023f6:	e9 2a f7 ff ff       	jmp    101b25 <__alltraps>

001023fb <vector219>:
.globl vector219
vector219:
  pushl $0
  1023fb:	6a 00                	push   $0x0
  pushl $219
  1023fd:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102402:	e9 1e f7 ff ff       	jmp    101b25 <__alltraps>

00102407 <vector220>:
.globl vector220
vector220:
  pushl $0
  102407:	6a 00                	push   $0x0
  pushl $220
  102409:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10240e:	e9 12 f7 ff ff       	jmp    101b25 <__alltraps>

00102413 <vector221>:
.globl vector221
vector221:
  pushl $0
  102413:	6a 00                	push   $0x0
  pushl $221
  102415:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  10241a:	e9 06 f7 ff ff       	jmp    101b25 <__alltraps>

0010241f <vector222>:
.globl vector222
vector222:
  pushl $0
  10241f:	6a 00                	push   $0x0
  pushl $222
  102421:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102426:	e9 fa f6 ff ff       	jmp    101b25 <__alltraps>

0010242b <vector223>:
.globl vector223
vector223:
  pushl $0
  10242b:	6a 00                	push   $0x0
  pushl $223
  10242d:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102432:	e9 ee f6 ff ff       	jmp    101b25 <__alltraps>

00102437 <vector224>:
.globl vector224
vector224:
  pushl $0
  102437:	6a 00                	push   $0x0
  pushl $224
  102439:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10243e:	e9 e2 f6 ff ff       	jmp    101b25 <__alltraps>

00102443 <vector225>:
.globl vector225
vector225:
  pushl $0
  102443:	6a 00                	push   $0x0
  pushl $225
  102445:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  10244a:	e9 d6 f6 ff ff       	jmp    101b25 <__alltraps>

0010244f <vector226>:
.globl vector226
vector226:
  pushl $0
  10244f:	6a 00                	push   $0x0
  pushl $226
  102451:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102456:	e9 ca f6 ff ff       	jmp    101b25 <__alltraps>

0010245b <vector227>:
.globl vector227
vector227:
  pushl $0
  10245b:	6a 00                	push   $0x0
  pushl $227
  10245d:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102462:	e9 be f6 ff ff       	jmp    101b25 <__alltraps>

00102467 <vector228>:
.globl vector228
vector228:
  pushl $0
  102467:	6a 00                	push   $0x0
  pushl $228
  102469:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10246e:	e9 b2 f6 ff ff       	jmp    101b25 <__alltraps>

00102473 <vector229>:
.globl vector229
vector229:
  pushl $0
  102473:	6a 00                	push   $0x0
  pushl $229
  102475:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10247a:	e9 a6 f6 ff ff       	jmp    101b25 <__alltraps>

0010247f <vector230>:
.globl vector230
vector230:
  pushl $0
  10247f:	6a 00                	push   $0x0
  pushl $230
  102481:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102486:	e9 9a f6 ff ff       	jmp    101b25 <__alltraps>

0010248b <vector231>:
.globl vector231
vector231:
  pushl $0
  10248b:	6a 00                	push   $0x0
  pushl $231
  10248d:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102492:	e9 8e f6 ff ff       	jmp    101b25 <__alltraps>

00102497 <vector232>:
.globl vector232
vector232:
  pushl $0
  102497:	6a 00                	push   $0x0
  pushl $232
  102499:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10249e:	e9 82 f6 ff ff       	jmp    101b25 <__alltraps>

001024a3 <vector233>:
.globl vector233
vector233:
  pushl $0
  1024a3:	6a 00                	push   $0x0
  pushl $233
  1024a5:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1024aa:	e9 76 f6 ff ff       	jmp    101b25 <__alltraps>

001024af <vector234>:
.globl vector234
vector234:
  pushl $0
  1024af:	6a 00                	push   $0x0
  pushl $234
  1024b1:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1024b6:	e9 6a f6 ff ff       	jmp    101b25 <__alltraps>

001024bb <vector235>:
.globl vector235
vector235:
  pushl $0
  1024bb:	6a 00                	push   $0x0
  pushl $235
  1024bd:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1024c2:	e9 5e f6 ff ff       	jmp    101b25 <__alltraps>

001024c7 <vector236>:
.globl vector236
vector236:
  pushl $0
  1024c7:	6a 00                	push   $0x0
  pushl $236
  1024c9:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1024ce:	e9 52 f6 ff ff       	jmp    101b25 <__alltraps>

001024d3 <vector237>:
.globl vector237
vector237:
  pushl $0
  1024d3:	6a 00                	push   $0x0
  pushl $237
  1024d5:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1024da:	e9 46 f6 ff ff       	jmp    101b25 <__alltraps>

001024df <vector238>:
.globl vector238
vector238:
  pushl $0
  1024df:	6a 00                	push   $0x0
  pushl $238
  1024e1:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1024e6:	e9 3a f6 ff ff       	jmp    101b25 <__alltraps>

001024eb <vector239>:
.globl vector239
vector239:
  pushl $0
  1024eb:	6a 00                	push   $0x0
  pushl $239
  1024ed:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1024f2:	e9 2e f6 ff ff       	jmp    101b25 <__alltraps>

001024f7 <vector240>:
.globl vector240
vector240:
  pushl $0
  1024f7:	6a 00                	push   $0x0
  pushl $240
  1024f9:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1024fe:	e9 22 f6 ff ff       	jmp    101b25 <__alltraps>

00102503 <vector241>:
.globl vector241
vector241:
  pushl $0
  102503:	6a 00                	push   $0x0
  pushl $241
  102505:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  10250a:	e9 16 f6 ff ff       	jmp    101b25 <__alltraps>

0010250f <vector242>:
.globl vector242
vector242:
  pushl $0
  10250f:	6a 00                	push   $0x0
  pushl $242
  102511:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102516:	e9 0a f6 ff ff       	jmp    101b25 <__alltraps>

0010251b <vector243>:
.globl vector243
vector243:
  pushl $0
  10251b:	6a 00                	push   $0x0
  pushl $243
  10251d:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102522:	e9 fe f5 ff ff       	jmp    101b25 <__alltraps>

00102527 <vector244>:
.globl vector244
vector244:
  pushl $0
  102527:	6a 00                	push   $0x0
  pushl $244
  102529:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10252e:	e9 f2 f5 ff ff       	jmp    101b25 <__alltraps>

00102533 <vector245>:
.globl vector245
vector245:
  pushl $0
  102533:	6a 00                	push   $0x0
  pushl $245
  102535:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  10253a:	e9 e6 f5 ff ff       	jmp    101b25 <__alltraps>

0010253f <vector246>:
.globl vector246
vector246:
  pushl $0
  10253f:	6a 00                	push   $0x0
  pushl $246
  102541:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102546:	e9 da f5 ff ff       	jmp    101b25 <__alltraps>

0010254b <vector247>:
.globl vector247
vector247:
  pushl $0
  10254b:	6a 00                	push   $0x0
  pushl $247
  10254d:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102552:	e9 ce f5 ff ff       	jmp    101b25 <__alltraps>

00102557 <vector248>:
.globl vector248
vector248:
  pushl $0
  102557:	6a 00                	push   $0x0
  pushl $248
  102559:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10255e:	e9 c2 f5 ff ff       	jmp    101b25 <__alltraps>

00102563 <vector249>:
.globl vector249
vector249:
  pushl $0
  102563:	6a 00                	push   $0x0
  pushl $249
  102565:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10256a:	e9 b6 f5 ff ff       	jmp    101b25 <__alltraps>

0010256f <vector250>:
.globl vector250
vector250:
  pushl $0
  10256f:	6a 00                	push   $0x0
  pushl $250
  102571:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102576:	e9 aa f5 ff ff       	jmp    101b25 <__alltraps>

0010257b <vector251>:
.globl vector251
vector251:
  pushl $0
  10257b:	6a 00                	push   $0x0
  pushl $251
  10257d:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102582:	e9 9e f5 ff ff       	jmp    101b25 <__alltraps>

00102587 <vector252>:
.globl vector252
vector252:
  pushl $0
  102587:	6a 00                	push   $0x0
  pushl $252
  102589:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10258e:	e9 92 f5 ff ff       	jmp    101b25 <__alltraps>

00102593 <vector253>:
.globl vector253
vector253:
  pushl $0
  102593:	6a 00                	push   $0x0
  pushl $253
  102595:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10259a:	e9 86 f5 ff ff       	jmp    101b25 <__alltraps>

0010259f <vector254>:
.globl vector254
vector254:
  pushl $0
  10259f:	6a 00                	push   $0x0
  pushl $254
  1025a1:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1025a6:	e9 7a f5 ff ff       	jmp    101b25 <__alltraps>

001025ab <vector255>:
.globl vector255
vector255:
  pushl $0
  1025ab:	6a 00                	push   $0x0
  pushl $255
  1025ad:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1025b2:	e9 6e f5 ff ff       	jmp    101b25 <__alltraps>

001025b7 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1025b7:	55                   	push   %ebp
  1025b8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1025ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1025bd:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1025c0:	b8 23 00 00 00       	mov    $0x23,%eax
  1025c5:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1025c7:	b8 23 00 00 00       	mov    $0x23,%eax
  1025cc:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1025ce:	b8 10 00 00 00       	mov    $0x10,%eax
  1025d3:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1025d5:	b8 10 00 00 00       	mov    $0x10,%eax
  1025da:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1025dc:	b8 10 00 00 00       	mov    $0x10,%eax
  1025e1:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1025e3:	ea ea 25 10 00 08 00 	ljmp   $0x8,$0x1025ea
}
  1025ea:	5d                   	pop    %ebp
  1025eb:	c3                   	ret    

001025ec <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1025ec:	55                   	push   %ebp
  1025ed:	89 e5                	mov    %esp,%ebp
  1025ef:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1025f2:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1025f7:	05 00 04 00 00       	add    $0x400,%eax
  1025fc:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102601:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102608:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10260a:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102611:	68 00 
  102613:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102618:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  10261e:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102623:	c1 e8 10             	shr    $0x10,%eax
  102626:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  10262b:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102632:	83 e0 f0             	and    $0xfffffff0,%eax
  102635:	83 c8 09             	or     $0x9,%eax
  102638:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10263d:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102644:	83 c8 10             	or     $0x10,%eax
  102647:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10264c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102653:	83 e0 9f             	and    $0xffffff9f,%eax
  102656:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10265b:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102662:	83 c8 80             	or     $0xffffff80,%eax
  102665:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10266a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102671:	83 e0 f0             	and    $0xfffffff0,%eax
  102674:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102679:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102680:	83 e0 ef             	and    $0xffffffef,%eax
  102683:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102688:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10268f:	83 e0 df             	and    $0xffffffdf,%eax
  102692:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102697:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10269e:	83 c8 40             	or     $0x40,%eax
  1026a1:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026a6:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1026ad:	83 e0 7f             	and    $0x7f,%eax
  1026b0:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1026b5:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026ba:	c1 e8 18             	shr    $0x18,%eax
  1026bd:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  1026c2:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026c9:	83 e0 ef             	and    $0xffffffef,%eax
  1026cc:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1026d1:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  1026d8:	e8 da fe ff ff       	call   1025b7 <lgdt>
  1026dd:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1026e3:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1026e7:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  1026ea:	c9                   	leave  
  1026eb:	c3                   	ret    

001026ec <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1026ec:	55                   	push   %ebp
  1026ed:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1026ef:	e8 f8 fe ff ff       	call   1025ec <gdt_init>
}
  1026f4:	5d                   	pop    %ebp
  1026f5:	c3                   	ret    

001026f6 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1026f6:	55                   	push   %ebp
  1026f7:	89 e5                	mov    %esp,%ebp
  1026f9:	83 ec 58             	sub    $0x58,%esp
  1026fc:	8b 45 10             	mov    0x10(%ebp),%eax
  1026ff:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102702:	8b 45 14             	mov    0x14(%ebp),%eax
  102705:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102708:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10270b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10270e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102711:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102714:	8b 45 18             	mov    0x18(%ebp),%eax
  102717:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10271a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10271d:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102720:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102723:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102726:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102729:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10272c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102730:	74 1c                	je     10274e <printnum+0x58>
  102732:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102735:	ba 00 00 00 00       	mov    $0x0,%edx
  10273a:	f7 75 e4             	divl   -0x1c(%ebp)
  10273d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102740:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102743:	ba 00 00 00 00       	mov    $0x0,%edx
  102748:	f7 75 e4             	divl   -0x1c(%ebp)
  10274b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10274e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102751:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102754:	f7 75 e4             	divl   -0x1c(%ebp)
  102757:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10275a:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10275d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102760:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102763:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102766:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102769:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10276c:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  10276f:	8b 45 18             	mov    0x18(%ebp),%eax
  102772:	ba 00 00 00 00       	mov    $0x0,%edx
  102777:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10277a:	77 56                	ja     1027d2 <printnum+0xdc>
  10277c:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10277f:	72 05                	jb     102786 <printnum+0x90>
  102781:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102784:	77 4c                	ja     1027d2 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102786:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102789:	8d 50 ff             	lea    -0x1(%eax),%edx
  10278c:	8b 45 20             	mov    0x20(%ebp),%eax
  10278f:	89 44 24 18          	mov    %eax,0x18(%esp)
  102793:	89 54 24 14          	mov    %edx,0x14(%esp)
  102797:	8b 45 18             	mov    0x18(%ebp),%eax
  10279a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10279e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1027a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027a4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1027a8:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1027ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027af:	89 44 24 04          	mov    %eax,0x4(%esp)
  1027b3:	8b 45 08             	mov    0x8(%ebp),%eax
  1027b6:	89 04 24             	mov    %eax,(%esp)
  1027b9:	e8 38 ff ff ff       	call   1026f6 <printnum>
  1027be:	eb 1c                	jmp    1027dc <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1027c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1027c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1027c7:	8b 45 20             	mov    0x20(%ebp),%eax
  1027ca:	89 04 24             	mov    %eax,(%esp)
  1027cd:	8b 45 08             	mov    0x8(%ebp),%eax
  1027d0:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  1027d2:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  1027d6:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1027da:	7f e4                	jg     1027c0 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1027dc:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1027df:	05 b0 39 10 00       	add    $0x1039b0,%eax
  1027e4:	0f b6 00             	movzbl (%eax),%eax
  1027e7:	0f be c0             	movsbl %al,%eax
  1027ea:	8b 55 0c             	mov    0xc(%ebp),%edx
  1027ed:	89 54 24 04          	mov    %edx,0x4(%esp)
  1027f1:	89 04 24             	mov    %eax,(%esp)
  1027f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1027f7:	ff d0                	call   *%eax
}
  1027f9:	c9                   	leave  
  1027fa:	c3                   	ret    

001027fb <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1027fb:	55                   	push   %ebp
  1027fc:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1027fe:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102802:	7e 14                	jle    102818 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102804:	8b 45 08             	mov    0x8(%ebp),%eax
  102807:	8b 00                	mov    (%eax),%eax
  102809:	8d 48 08             	lea    0x8(%eax),%ecx
  10280c:	8b 55 08             	mov    0x8(%ebp),%edx
  10280f:	89 0a                	mov    %ecx,(%edx)
  102811:	8b 50 04             	mov    0x4(%eax),%edx
  102814:	8b 00                	mov    (%eax),%eax
  102816:	eb 30                	jmp    102848 <getuint+0x4d>
    }
    else if (lflag) {
  102818:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10281c:	74 16                	je     102834 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  10281e:	8b 45 08             	mov    0x8(%ebp),%eax
  102821:	8b 00                	mov    (%eax),%eax
  102823:	8d 48 04             	lea    0x4(%eax),%ecx
  102826:	8b 55 08             	mov    0x8(%ebp),%edx
  102829:	89 0a                	mov    %ecx,(%edx)
  10282b:	8b 00                	mov    (%eax),%eax
  10282d:	ba 00 00 00 00       	mov    $0x0,%edx
  102832:	eb 14                	jmp    102848 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102834:	8b 45 08             	mov    0x8(%ebp),%eax
  102837:	8b 00                	mov    (%eax),%eax
  102839:	8d 48 04             	lea    0x4(%eax),%ecx
  10283c:	8b 55 08             	mov    0x8(%ebp),%edx
  10283f:	89 0a                	mov    %ecx,(%edx)
  102841:	8b 00                	mov    (%eax),%eax
  102843:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102848:	5d                   	pop    %ebp
  102849:	c3                   	ret    

0010284a <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  10284a:	55                   	push   %ebp
  10284b:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10284d:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102851:	7e 14                	jle    102867 <getint+0x1d>
        return va_arg(*ap, long long);
  102853:	8b 45 08             	mov    0x8(%ebp),%eax
  102856:	8b 00                	mov    (%eax),%eax
  102858:	8d 48 08             	lea    0x8(%eax),%ecx
  10285b:	8b 55 08             	mov    0x8(%ebp),%edx
  10285e:	89 0a                	mov    %ecx,(%edx)
  102860:	8b 50 04             	mov    0x4(%eax),%edx
  102863:	8b 00                	mov    (%eax),%eax
  102865:	eb 28                	jmp    10288f <getint+0x45>
    }
    else if (lflag) {
  102867:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10286b:	74 12                	je     10287f <getint+0x35>
        return va_arg(*ap, long);
  10286d:	8b 45 08             	mov    0x8(%ebp),%eax
  102870:	8b 00                	mov    (%eax),%eax
  102872:	8d 48 04             	lea    0x4(%eax),%ecx
  102875:	8b 55 08             	mov    0x8(%ebp),%edx
  102878:	89 0a                	mov    %ecx,(%edx)
  10287a:	8b 00                	mov    (%eax),%eax
  10287c:	99                   	cltd   
  10287d:	eb 10                	jmp    10288f <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  10287f:	8b 45 08             	mov    0x8(%ebp),%eax
  102882:	8b 00                	mov    (%eax),%eax
  102884:	8d 48 04             	lea    0x4(%eax),%ecx
  102887:	8b 55 08             	mov    0x8(%ebp),%edx
  10288a:	89 0a                	mov    %ecx,(%edx)
  10288c:	8b 00                	mov    (%eax),%eax
  10288e:	99                   	cltd   
    }
}
  10288f:	5d                   	pop    %ebp
  102890:	c3                   	ret    

00102891 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102891:	55                   	push   %ebp
  102892:	89 e5                	mov    %esp,%ebp
  102894:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102897:	8d 45 14             	lea    0x14(%ebp),%eax
  10289a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  10289d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1028a0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1028a4:	8b 45 10             	mov    0x10(%ebp),%eax
  1028a7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1028ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1028b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1028b5:	89 04 24             	mov    %eax,(%esp)
  1028b8:	e8 02 00 00 00       	call   1028bf <vprintfmt>
    va_end(ap);
}
  1028bd:	c9                   	leave  
  1028be:	c3                   	ret    

001028bf <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1028bf:	55                   	push   %ebp
  1028c0:	89 e5                	mov    %esp,%ebp
  1028c2:	56                   	push   %esi
  1028c3:	53                   	push   %ebx
  1028c4:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1028c7:	eb 18                	jmp    1028e1 <vprintfmt+0x22>
            if (ch == '\0') {
  1028c9:	85 db                	test   %ebx,%ebx
  1028cb:	75 05                	jne    1028d2 <vprintfmt+0x13>
                return;
  1028cd:	e9 d1 03 00 00       	jmp    102ca3 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  1028d2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1028d9:	89 1c 24             	mov    %ebx,(%esp)
  1028dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1028df:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1028e1:	8b 45 10             	mov    0x10(%ebp),%eax
  1028e4:	8d 50 01             	lea    0x1(%eax),%edx
  1028e7:	89 55 10             	mov    %edx,0x10(%ebp)
  1028ea:	0f b6 00             	movzbl (%eax),%eax
  1028ed:	0f b6 d8             	movzbl %al,%ebx
  1028f0:	83 fb 25             	cmp    $0x25,%ebx
  1028f3:	75 d4                	jne    1028c9 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  1028f5:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1028f9:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102900:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102903:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102906:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  10290d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102910:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102913:	8b 45 10             	mov    0x10(%ebp),%eax
  102916:	8d 50 01             	lea    0x1(%eax),%edx
  102919:	89 55 10             	mov    %edx,0x10(%ebp)
  10291c:	0f b6 00             	movzbl (%eax),%eax
  10291f:	0f b6 d8             	movzbl %al,%ebx
  102922:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102925:	83 f8 55             	cmp    $0x55,%eax
  102928:	0f 87 44 03 00 00    	ja     102c72 <vprintfmt+0x3b3>
  10292e:	8b 04 85 d4 39 10 00 	mov    0x1039d4(,%eax,4),%eax
  102935:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102937:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  10293b:	eb d6                	jmp    102913 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10293d:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102941:	eb d0                	jmp    102913 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102943:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  10294a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10294d:	89 d0                	mov    %edx,%eax
  10294f:	c1 e0 02             	shl    $0x2,%eax
  102952:	01 d0                	add    %edx,%eax
  102954:	01 c0                	add    %eax,%eax
  102956:	01 d8                	add    %ebx,%eax
  102958:	83 e8 30             	sub    $0x30,%eax
  10295b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10295e:	8b 45 10             	mov    0x10(%ebp),%eax
  102961:	0f b6 00             	movzbl (%eax),%eax
  102964:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102967:	83 fb 2f             	cmp    $0x2f,%ebx
  10296a:	7e 0b                	jle    102977 <vprintfmt+0xb8>
  10296c:	83 fb 39             	cmp    $0x39,%ebx
  10296f:	7f 06                	jg     102977 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102971:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102975:	eb d3                	jmp    10294a <vprintfmt+0x8b>
            goto process_precision;
  102977:	eb 33                	jmp    1029ac <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102979:	8b 45 14             	mov    0x14(%ebp),%eax
  10297c:	8d 50 04             	lea    0x4(%eax),%edx
  10297f:	89 55 14             	mov    %edx,0x14(%ebp)
  102982:	8b 00                	mov    (%eax),%eax
  102984:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102987:	eb 23                	jmp    1029ac <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102989:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10298d:	79 0c                	jns    10299b <vprintfmt+0xdc>
                width = 0;
  10298f:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102996:	e9 78 ff ff ff       	jmp    102913 <vprintfmt+0x54>
  10299b:	e9 73 ff ff ff       	jmp    102913 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  1029a0:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1029a7:	e9 67 ff ff ff       	jmp    102913 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  1029ac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1029b0:	79 12                	jns    1029c4 <vprintfmt+0x105>
                width = precision, precision = -1;
  1029b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029b5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1029b8:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1029bf:	e9 4f ff ff ff       	jmp    102913 <vprintfmt+0x54>
  1029c4:	e9 4a ff ff ff       	jmp    102913 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1029c9:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  1029cd:	e9 41 ff ff ff       	jmp    102913 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1029d2:	8b 45 14             	mov    0x14(%ebp),%eax
  1029d5:	8d 50 04             	lea    0x4(%eax),%edx
  1029d8:	89 55 14             	mov    %edx,0x14(%ebp)
  1029db:	8b 00                	mov    (%eax),%eax
  1029dd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1029e4:	89 04 24             	mov    %eax,(%esp)
  1029e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029ea:	ff d0                	call   *%eax
            break;
  1029ec:	e9 ac 02 00 00       	jmp    102c9d <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  1029f1:	8b 45 14             	mov    0x14(%ebp),%eax
  1029f4:	8d 50 04             	lea    0x4(%eax),%edx
  1029f7:	89 55 14             	mov    %edx,0x14(%ebp)
  1029fa:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1029fc:	85 db                	test   %ebx,%ebx
  1029fe:	79 02                	jns    102a02 <vprintfmt+0x143>
                err = -err;
  102a00:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102a02:	83 fb 06             	cmp    $0x6,%ebx
  102a05:	7f 0b                	jg     102a12 <vprintfmt+0x153>
  102a07:	8b 34 9d 94 39 10 00 	mov    0x103994(,%ebx,4),%esi
  102a0e:	85 f6                	test   %esi,%esi
  102a10:	75 23                	jne    102a35 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102a12:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102a16:	c7 44 24 08 c1 39 10 	movl   $0x1039c1,0x8(%esp)
  102a1d:	00 
  102a1e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a21:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a25:	8b 45 08             	mov    0x8(%ebp),%eax
  102a28:	89 04 24             	mov    %eax,(%esp)
  102a2b:	e8 61 fe ff ff       	call   102891 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102a30:	e9 68 02 00 00       	jmp    102c9d <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102a35:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102a39:	c7 44 24 08 ca 39 10 	movl   $0x1039ca,0x8(%esp)
  102a40:	00 
  102a41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a44:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a48:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4b:	89 04 24             	mov    %eax,(%esp)
  102a4e:	e8 3e fe ff ff       	call   102891 <printfmt>
            }
            break;
  102a53:	e9 45 02 00 00       	jmp    102c9d <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102a58:	8b 45 14             	mov    0x14(%ebp),%eax
  102a5b:	8d 50 04             	lea    0x4(%eax),%edx
  102a5e:	89 55 14             	mov    %edx,0x14(%ebp)
  102a61:	8b 30                	mov    (%eax),%esi
  102a63:	85 f6                	test   %esi,%esi
  102a65:	75 05                	jne    102a6c <vprintfmt+0x1ad>
                p = "(null)";
  102a67:	be cd 39 10 00       	mov    $0x1039cd,%esi
            }
            if (width > 0 && padc != '-') {
  102a6c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a70:	7e 3e                	jle    102ab0 <vprintfmt+0x1f1>
  102a72:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102a76:	74 38                	je     102ab0 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102a78:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102a7b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a82:	89 34 24             	mov    %esi,(%esp)
  102a85:	e8 15 03 00 00       	call   102d9f <strnlen>
  102a8a:	29 c3                	sub    %eax,%ebx
  102a8c:	89 d8                	mov    %ebx,%eax
  102a8e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a91:	eb 17                	jmp    102aaa <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102a93:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102a97:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a9a:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a9e:	89 04 24             	mov    %eax,(%esp)
  102aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  102aa4:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102aa6:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102aaa:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102aae:	7f e3                	jg     102a93 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ab0:	eb 38                	jmp    102aea <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102ab2:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102ab6:	74 1f                	je     102ad7 <vprintfmt+0x218>
  102ab8:	83 fb 1f             	cmp    $0x1f,%ebx
  102abb:	7e 05                	jle    102ac2 <vprintfmt+0x203>
  102abd:	83 fb 7e             	cmp    $0x7e,%ebx
  102ac0:	7e 15                	jle    102ad7 <vprintfmt+0x218>
                    putch('?', putdat);
  102ac2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ac9:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102ad0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad3:	ff d0                	call   *%eax
  102ad5:	eb 0f                	jmp    102ae6 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102ad7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ada:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ade:	89 1c 24             	mov    %ebx,(%esp)
  102ae1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae4:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102ae6:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102aea:	89 f0                	mov    %esi,%eax
  102aec:	8d 70 01             	lea    0x1(%eax),%esi
  102aef:	0f b6 00             	movzbl (%eax),%eax
  102af2:	0f be d8             	movsbl %al,%ebx
  102af5:	85 db                	test   %ebx,%ebx
  102af7:	74 10                	je     102b09 <vprintfmt+0x24a>
  102af9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102afd:	78 b3                	js     102ab2 <vprintfmt+0x1f3>
  102aff:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102b03:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b07:	79 a9                	jns    102ab2 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102b09:	eb 17                	jmp    102b22 <vprintfmt+0x263>
                putch(' ', putdat);
  102b0b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b0e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b12:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102b19:	8b 45 08             	mov    0x8(%ebp),%eax
  102b1c:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102b1e:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b22:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b26:	7f e3                	jg     102b0b <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102b28:	e9 70 01 00 00       	jmp    102c9d <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102b2d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b30:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b34:	8d 45 14             	lea    0x14(%ebp),%eax
  102b37:	89 04 24             	mov    %eax,(%esp)
  102b3a:	e8 0b fd ff ff       	call   10284a <getint>
  102b3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b42:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b48:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b4b:	85 d2                	test   %edx,%edx
  102b4d:	79 26                	jns    102b75 <vprintfmt+0x2b6>
                putch('-', putdat);
  102b4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b52:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b56:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102b5d:	8b 45 08             	mov    0x8(%ebp),%eax
  102b60:	ff d0                	call   *%eax
                num = -(long long)num;
  102b62:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b65:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b68:	f7 d8                	neg    %eax
  102b6a:	83 d2 00             	adc    $0x0,%edx
  102b6d:	f7 da                	neg    %edx
  102b6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b72:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102b75:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102b7c:	e9 a8 00 00 00       	jmp    102c29 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102b81:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b84:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b88:	8d 45 14             	lea    0x14(%ebp),%eax
  102b8b:	89 04 24             	mov    %eax,(%esp)
  102b8e:	e8 68 fc ff ff       	call   1027fb <getuint>
  102b93:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b96:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102b99:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102ba0:	e9 84 00 00 00       	jmp    102c29 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102ba5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ba8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bac:	8d 45 14             	lea    0x14(%ebp),%eax
  102baf:	89 04 24             	mov    %eax,(%esp)
  102bb2:	e8 44 fc ff ff       	call   1027fb <getuint>
  102bb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bba:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102bbd:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102bc4:	eb 63                	jmp    102c29 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102bc6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bcd:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102bd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd7:	ff d0                	call   *%eax
            putch('x', putdat);
  102bd9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bdc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102be0:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102be7:	8b 45 08             	mov    0x8(%ebp),%eax
  102bea:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102bec:	8b 45 14             	mov    0x14(%ebp),%eax
  102bef:	8d 50 04             	lea    0x4(%eax),%edx
  102bf2:	89 55 14             	mov    %edx,0x14(%ebp)
  102bf5:	8b 00                	mov    (%eax),%eax
  102bf7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102bfa:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102c01:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102c08:	eb 1f                	jmp    102c29 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102c0a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c11:	8d 45 14             	lea    0x14(%ebp),%eax
  102c14:	89 04 24             	mov    %eax,(%esp)
  102c17:	e8 df fb ff ff       	call   1027fb <getuint>
  102c1c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c1f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102c22:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102c29:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102c2d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102c30:	89 54 24 18          	mov    %edx,0x18(%esp)
  102c34:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102c37:	89 54 24 14          	mov    %edx,0x14(%esp)
  102c3b:	89 44 24 10          	mov    %eax,0x10(%esp)
  102c3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c42:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c45:	89 44 24 08          	mov    %eax,0x8(%esp)
  102c49:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102c4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c50:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c54:	8b 45 08             	mov    0x8(%ebp),%eax
  102c57:	89 04 24             	mov    %eax,(%esp)
  102c5a:	e8 97 fa ff ff       	call   1026f6 <printnum>
            break;
  102c5f:	eb 3c                	jmp    102c9d <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102c61:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c64:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c68:	89 1c 24             	mov    %ebx,(%esp)
  102c6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c6e:	ff d0                	call   *%eax
            break;
  102c70:	eb 2b                	jmp    102c9d <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102c72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c75:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c79:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102c80:	8b 45 08             	mov    0x8(%ebp),%eax
  102c83:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102c85:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102c89:	eb 04                	jmp    102c8f <vprintfmt+0x3d0>
  102c8b:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102c8f:	8b 45 10             	mov    0x10(%ebp),%eax
  102c92:	83 e8 01             	sub    $0x1,%eax
  102c95:	0f b6 00             	movzbl (%eax),%eax
  102c98:	3c 25                	cmp    $0x25,%al
  102c9a:	75 ef                	jne    102c8b <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102c9c:	90                   	nop
        }
    }
  102c9d:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102c9e:	e9 3e fc ff ff       	jmp    1028e1 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102ca3:	83 c4 40             	add    $0x40,%esp
  102ca6:	5b                   	pop    %ebx
  102ca7:	5e                   	pop    %esi
  102ca8:	5d                   	pop    %ebp
  102ca9:	c3                   	ret    

00102caa <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102caa:	55                   	push   %ebp
  102cab:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102cad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb0:	8b 40 08             	mov    0x8(%eax),%eax
  102cb3:	8d 50 01             	lea    0x1(%eax),%edx
  102cb6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cb9:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102cbc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cbf:	8b 10                	mov    (%eax),%edx
  102cc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cc4:	8b 40 04             	mov    0x4(%eax),%eax
  102cc7:	39 c2                	cmp    %eax,%edx
  102cc9:	73 12                	jae    102cdd <sprintputch+0x33>
        *b->buf ++ = ch;
  102ccb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cce:	8b 00                	mov    (%eax),%eax
  102cd0:	8d 48 01             	lea    0x1(%eax),%ecx
  102cd3:	8b 55 0c             	mov    0xc(%ebp),%edx
  102cd6:	89 0a                	mov    %ecx,(%edx)
  102cd8:	8b 55 08             	mov    0x8(%ebp),%edx
  102cdb:	88 10                	mov    %dl,(%eax)
    }
}
  102cdd:	5d                   	pop    %ebp
  102cde:	c3                   	ret    

00102cdf <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102cdf:	55                   	push   %ebp
  102ce0:	89 e5                	mov    %esp,%ebp
  102ce2:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102ce5:	8d 45 14             	lea    0x14(%ebp),%eax
  102ce8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102ceb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cee:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102cf2:	8b 45 10             	mov    0x10(%ebp),%eax
  102cf5:	89 44 24 08          	mov    %eax,0x8(%esp)
  102cf9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d00:	8b 45 08             	mov    0x8(%ebp),%eax
  102d03:	89 04 24             	mov    %eax,(%esp)
  102d06:	e8 08 00 00 00       	call   102d13 <vsnprintf>
  102d0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102d0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102d11:	c9                   	leave  
  102d12:	c3                   	ret    

00102d13 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102d13:	55                   	push   %ebp
  102d14:	89 e5                	mov    %esp,%ebp
  102d16:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102d19:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d22:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d25:	8b 45 08             	mov    0x8(%ebp),%eax
  102d28:	01 d0                	add    %edx,%eax
  102d2a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d2d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102d34:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102d38:	74 0a                	je     102d44 <vsnprintf+0x31>
  102d3a:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d40:	39 c2                	cmp    %eax,%edx
  102d42:	76 07                	jbe    102d4b <vsnprintf+0x38>
        return -E_INVAL;
  102d44:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102d49:	eb 2a                	jmp    102d75 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102d4b:	8b 45 14             	mov    0x14(%ebp),%eax
  102d4e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d52:	8b 45 10             	mov    0x10(%ebp),%eax
  102d55:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d59:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102d5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d60:	c7 04 24 aa 2c 10 00 	movl   $0x102caa,(%esp)
  102d67:	e8 53 fb ff ff       	call   1028bf <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102d6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102d6f:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102d75:	c9                   	leave  
  102d76:	c3                   	ret    

00102d77 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102d77:	55                   	push   %ebp
  102d78:	89 e5                	mov    %esp,%ebp
  102d7a:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102d7d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102d84:	eb 04                	jmp    102d8a <strlen+0x13>
        cnt ++;
  102d86:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102d8a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8d:	8d 50 01             	lea    0x1(%eax),%edx
  102d90:	89 55 08             	mov    %edx,0x8(%ebp)
  102d93:	0f b6 00             	movzbl (%eax),%eax
  102d96:	84 c0                	test   %al,%al
  102d98:	75 ec                	jne    102d86 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102d9a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102d9d:	c9                   	leave  
  102d9e:	c3                   	ret    

00102d9f <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102d9f:	55                   	push   %ebp
  102da0:	89 e5                	mov    %esp,%ebp
  102da2:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102da5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102dac:	eb 04                	jmp    102db2 <strnlen+0x13>
        cnt ++;
  102dae:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102db2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102db5:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102db8:	73 10                	jae    102dca <strnlen+0x2b>
  102dba:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbd:	8d 50 01             	lea    0x1(%eax),%edx
  102dc0:	89 55 08             	mov    %edx,0x8(%ebp)
  102dc3:	0f b6 00             	movzbl (%eax),%eax
  102dc6:	84 c0                	test   %al,%al
  102dc8:	75 e4                	jne    102dae <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102dca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102dcd:	c9                   	leave  
  102dce:	c3                   	ret    

00102dcf <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102dcf:	55                   	push   %ebp
  102dd0:	89 e5                	mov    %esp,%ebp
  102dd2:	57                   	push   %edi
  102dd3:	56                   	push   %esi
  102dd4:	83 ec 20             	sub    $0x20,%esp
  102dd7:	8b 45 08             	mov    0x8(%ebp),%eax
  102dda:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ddd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102de0:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102de3:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102de6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102de9:	89 d1                	mov    %edx,%ecx
  102deb:	89 c2                	mov    %eax,%edx
  102ded:	89 ce                	mov    %ecx,%esi
  102def:	89 d7                	mov    %edx,%edi
  102df1:	ac                   	lods   %ds:(%esi),%al
  102df2:	aa                   	stos   %al,%es:(%edi)
  102df3:	84 c0                	test   %al,%al
  102df5:	75 fa                	jne    102df1 <strcpy+0x22>
  102df7:	89 fa                	mov    %edi,%edx
  102df9:	89 f1                	mov    %esi,%ecx
  102dfb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dfe:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102e01:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102e04:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102e07:	83 c4 20             	add    $0x20,%esp
  102e0a:	5e                   	pop    %esi
  102e0b:	5f                   	pop    %edi
  102e0c:	5d                   	pop    %ebp
  102e0d:	c3                   	ret    

00102e0e <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102e0e:	55                   	push   %ebp
  102e0f:	89 e5                	mov    %esp,%ebp
  102e11:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102e14:	8b 45 08             	mov    0x8(%ebp),%eax
  102e17:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102e1a:	eb 21                	jmp    102e3d <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102e1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e1f:	0f b6 10             	movzbl (%eax),%edx
  102e22:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e25:	88 10                	mov    %dl,(%eax)
  102e27:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e2a:	0f b6 00             	movzbl (%eax),%eax
  102e2d:	84 c0                	test   %al,%al
  102e2f:	74 04                	je     102e35 <strncpy+0x27>
            src ++;
  102e31:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102e35:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102e39:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102e3d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e41:	75 d9                	jne    102e1c <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102e43:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102e46:	c9                   	leave  
  102e47:	c3                   	ret    

00102e48 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102e48:	55                   	push   %ebp
  102e49:	89 e5                	mov    %esp,%ebp
  102e4b:	57                   	push   %edi
  102e4c:	56                   	push   %esi
  102e4d:	83 ec 20             	sub    $0x20,%esp
  102e50:	8b 45 08             	mov    0x8(%ebp),%eax
  102e53:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e56:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e59:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102e5c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e5f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e62:	89 d1                	mov    %edx,%ecx
  102e64:	89 c2                	mov    %eax,%edx
  102e66:	89 ce                	mov    %ecx,%esi
  102e68:	89 d7                	mov    %edx,%edi
  102e6a:	ac                   	lods   %ds:(%esi),%al
  102e6b:	ae                   	scas   %es:(%edi),%al
  102e6c:	75 08                	jne    102e76 <strcmp+0x2e>
  102e6e:	84 c0                	test   %al,%al
  102e70:	75 f8                	jne    102e6a <strcmp+0x22>
  102e72:	31 c0                	xor    %eax,%eax
  102e74:	eb 04                	jmp    102e7a <strcmp+0x32>
  102e76:	19 c0                	sbb    %eax,%eax
  102e78:	0c 01                	or     $0x1,%al
  102e7a:	89 fa                	mov    %edi,%edx
  102e7c:	89 f1                	mov    %esi,%ecx
  102e7e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e81:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102e84:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102e87:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102e8a:	83 c4 20             	add    $0x20,%esp
  102e8d:	5e                   	pop    %esi
  102e8e:	5f                   	pop    %edi
  102e8f:	5d                   	pop    %ebp
  102e90:	c3                   	ret    

00102e91 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102e91:	55                   	push   %ebp
  102e92:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102e94:	eb 0c                	jmp    102ea2 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102e96:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e9a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102e9e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102ea2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ea6:	74 1a                	je     102ec2 <strncmp+0x31>
  102ea8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eab:	0f b6 00             	movzbl (%eax),%eax
  102eae:	84 c0                	test   %al,%al
  102eb0:	74 10                	je     102ec2 <strncmp+0x31>
  102eb2:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb5:	0f b6 10             	movzbl (%eax),%edx
  102eb8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ebb:	0f b6 00             	movzbl (%eax),%eax
  102ebe:	38 c2                	cmp    %al,%dl
  102ec0:	74 d4                	je     102e96 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102ec2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ec6:	74 18                	je     102ee0 <strncmp+0x4f>
  102ec8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ecb:	0f b6 00             	movzbl (%eax),%eax
  102ece:	0f b6 d0             	movzbl %al,%edx
  102ed1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ed4:	0f b6 00             	movzbl (%eax),%eax
  102ed7:	0f b6 c0             	movzbl %al,%eax
  102eda:	29 c2                	sub    %eax,%edx
  102edc:	89 d0                	mov    %edx,%eax
  102ede:	eb 05                	jmp    102ee5 <strncmp+0x54>
  102ee0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102ee5:	5d                   	pop    %ebp
  102ee6:	c3                   	ret    

00102ee7 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102ee7:	55                   	push   %ebp
  102ee8:	89 e5                	mov    %esp,%ebp
  102eea:	83 ec 04             	sub    $0x4,%esp
  102eed:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef0:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102ef3:	eb 14                	jmp    102f09 <strchr+0x22>
        if (*s == c) {
  102ef5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef8:	0f b6 00             	movzbl (%eax),%eax
  102efb:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102efe:	75 05                	jne    102f05 <strchr+0x1e>
            return (char *)s;
  102f00:	8b 45 08             	mov    0x8(%ebp),%eax
  102f03:	eb 13                	jmp    102f18 <strchr+0x31>
        }
        s ++;
  102f05:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102f09:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0c:	0f b6 00             	movzbl (%eax),%eax
  102f0f:	84 c0                	test   %al,%al
  102f11:	75 e2                	jne    102ef5 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102f13:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f18:	c9                   	leave  
  102f19:	c3                   	ret    

00102f1a <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102f1a:	55                   	push   %ebp
  102f1b:	89 e5                	mov    %esp,%ebp
  102f1d:	83 ec 04             	sub    $0x4,%esp
  102f20:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f23:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f26:	eb 11                	jmp    102f39 <strfind+0x1f>
        if (*s == c) {
  102f28:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2b:	0f b6 00             	movzbl (%eax),%eax
  102f2e:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102f31:	75 02                	jne    102f35 <strfind+0x1b>
            break;
  102f33:	eb 0e                	jmp    102f43 <strfind+0x29>
        }
        s ++;
  102f35:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102f39:	8b 45 08             	mov    0x8(%ebp),%eax
  102f3c:	0f b6 00             	movzbl (%eax),%eax
  102f3f:	84 c0                	test   %al,%al
  102f41:	75 e5                	jne    102f28 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  102f43:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102f46:	c9                   	leave  
  102f47:	c3                   	ret    

00102f48 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102f48:	55                   	push   %ebp
  102f49:	89 e5                	mov    %esp,%ebp
  102f4b:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102f4e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102f55:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102f5c:	eb 04                	jmp    102f62 <strtol+0x1a>
        s ++;
  102f5e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102f62:	8b 45 08             	mov    0x8(%ebp),%eax
  102f65:	0f b6 00             	movzbl (%eax),%eax
  102f68:	3c 20                	cmp    $0x20,%al
  102f6a:	74 f2                	je     102f5e <strtol+0x16>
  102f6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f6f:	0f b6 00             	movzbl (%eax),%eax
  102f72:	3c 09                	cmp    $0x9,%al
  102f74:	74 e8                	je     102f5e <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102f76:	8b 45 08             	mov    0x8(%ebp),%eax
  102f79:	0f b6 00             	movzbl (%eax),%eax
  102f7c:	3c 2b                	cmp    $0x2b,%al
  102f7e:	75 06                	jne    102f86 <strtol+0x3e>
        s ++;
  102f80:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f84:	eb 15                	jmp    102f9b <strtol+0x53>
    }
    else if (*s == '-') {
  102f86:	8b 45 08             	mov    0x8(%ebp),%eax
  102f89:	0f b6 00             	movzbl (%eax),%eax
  102f8c:	3c 2d                	cmp    $0x2d,%al
  102f8e:	75 0b                	jne    102f9b <strtol+0x53>
        s ++, neg = 1;
  102f90:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f94:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102f9b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f9f:	74 06                	je     102fa7 <strtol+0x5f>
  102fa1:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102fa5:	75 24                	jne    102fcb <strtol+0x83>
  102fa7:	8b 45 08             	mov    0x8(%ebp),%eax
  102faa:	0f b6 00             	movzbl (%eax),%eax
  102fad:	3c 30                	cmp    $0x30,%al
  102faf:	75 1a                	jne    102fcb <strtol+0x83>
  102fb1:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb4:	83 c0 01             	add    $0x1,%eax
  102fb7:	0f b6 00             	movzbl (%eax),%eax
  102fba:	3c 78                	cmp    $0x78,%al
  102fbc:	75 0d                	jne    102fcb <strtol+0x83>
        s += 2, base = 16;
  102fbe:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102fc2:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102fc9:	eb 2a                	jmp    102ff5 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  102fcb:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102fcf:	75 17                	jne    102fe8 <strtol+0xa0>
  102fd1:	8b 45 08             	mov    0x8(%ebp),%eax
  102fd4:	0f b6 00             	movzbl (%eax),%eax
  102fd7:	3c 30                	cmp    $0x30,%al
  102fd9:	75 0d                	jne    102fe8 <strtol+0xa0>
        s ++, base = 8;
  102fdb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102fdf:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102fe6:	eb 0d                	jmp    102ff5 <strtol+0xad>
    }
    else if (base == 0) {
  102fe8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102fec:	75 07                	jne    102ff5 <strtol+0xad>
        base = 10;
  102fee:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102ff5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff8:	0f b6 00             	movzbl (%eax),%eax
  102ffb:	3c 2f                	cmp    $0x2f,%al
  102ffd:	7e 1b                	jle    10301a <strtol+0xd2>
  102fff:	8b 45 08             	mov    0x8(%ebp),%eax
  103002:	0f b6 00             	movzbl (%eax),%eax
  103005:	3c 39                	cmp    $0x39,%al
  103007:	7f 11                	jg     10301a <strtol+0xd2>
            dig = *s - '0';
  103009:	8b 45 08             	mov    0x8(%ebp),%eax
  10300c:	0f b6 00             	movzbl (%eax),%eax
  10300f:	0f be c0             	movsbl %al,%eax
  103012:	83 e8 30             	sub    $0x30,%eax
  103015:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103018:	eb 48                	jmp    103062 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  10301a:	8b 45 08             	mov    0x8(%ebp),%eax
  10301d:	0f b6 00             	movzbl (%eax),%eax
  103020:	3c 60                	cmp    $0x60,%al
  103022:	7e 1b                	jle    10303f <strtol+0xf7>
  103024:	8b 45 08             	mov    0x8(%ebp),%eax
  103027:	0f b6 00             	movzbl (%eax),%eax
  10302a:	3c 7a                	cmp    $0x7a,%al
  10302c:	7f 11                	jg     10303f <strtol+0xf7>
            dig = *s - 'a' + 10;
  10302e:	8b 45 08             	mov    0x8(%ebp),%eax
  103031:	0f b6 00             	movzbl (%eax),%eax
  103034:	0f be c0             	movsbl %al,%eax
  103037:	83 e8 57             	sub    $0x57,%eax
  10303a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10303d:	eb 23                	jmp    103062 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  10303f:	8b 45 08             	mov    0x8(%ebp),%eax
  103042:	0f b6 00             	movzbl (%eax),%eax
  103045:	3c 40                	cmp    $0x40,%al
  103047:	7e 3d                	jle    103086 <strtol+0x13e>
  103049:	8b 45 08             	mov    0x8(%ebp),%eax
  10304c:	0f b6 00             	movzbl (%eax),%eax
  10304f:	3c 5a                	cmp    $0x5a,%al
  103051:	7f 33                	jg     103086 <strtol+0x13e>
            dig = *s - 'A' + 10;
  103053:	8b 45 08             	mov    0x8(%ebp),%eax
  103056:	0f b6 00             	movzbl (%eax),%eax
  103059:	0f be c0             	movsbl %al,%eax
  10305c:	83 e8 37             	sub    $0x37,%eax
  10305f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103062:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103065:	3b 45 10             	cmp    0x10(%ebp),%eax
  103068:	7c 02                	jl     10306c <strtol+0x124>
            break;
  10306a:	eb 1a                	jmp    103086 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  10306c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103070:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103073:	0f af 45 10          	imul   0x10(%ebp),%eax
  103077:	89 c2                	mov    %eax,%edx
  103079:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10307c:	01 d0                	add    %edx,%eax
  10307e:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103081:	e9 6f ff ff ff       	jmp    102ff5 <strtol+0xad>

    if (endptr) {
  103086:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10308a:	74 08                	je     103094 <strtol+0x14c>
        *endptr = (char *) s;
  10308c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10308f:	8b 55 08             	mov    0x8(%ebp),%edx
  103092:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103094:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103098:	74 07                	je     1030a1 <strtol+0x159>
  10309a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10309d:	f7 d8                	neg    %eax
  10309f:	eb 03                	jmp    1030a4 <strtol+0x15c>
  1030a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1030a4:	c9                   	leave  
  1030a5:	c3                   	ret    

001030a6 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1030a6:	55                   	push   %ebp
  1030a7:	89 e5                	mov    %esp,%ebp
  1030a9:	57                   	push   %edi
  1030aa:	83 ec 24             	sub    $0x24,%esp
  1030ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030b0:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1030b3:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  1030b7:	8b 55 08             	mov    0x8(%ebp),%edx
  1030ba:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1030bd:	88 45 f7             	mov    %al,-0x9(%ebp)
  1030c0:	8b 45 10             	mov    0x10(%ebp),%eax
  1030c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1030c6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1030c9:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1030cd:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1030d0:	89 d7                	mov    %edx,%edi
  1030d2:	f3 aa                	rep stos %al,%es:(%edi)
  1030d4:	89 fa                	mov    %edi,%edx
  1030d6:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1030d9:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1030dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1030df:	83 c4 24             	add    $0x24,%esp
  1030e2:	5f                   	pop    %edi
  1030e3:	5d                   	pop    %ebp
  1030e4:	c3                   	ret    

001030e5 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1030e5:	55                   	push   %ebp
  1030e6:	89 e5                	mov    %esp,%ebp
  1030e8:	57                   	push   %edi
  1030e9:	56                   	push   %esi
  1030ea:	53                   	push   %ebx
  1030eb:	83 ec 30             	sub    $0x30,%esp
  1030ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030f4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030fa:	8b 45 10             	mov    0x10(%ebp),%eax
  1030fd:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  103100:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103103:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103106:	73 42                	jae    10314a <memmove+0x65>
  103108:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10310b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10310e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103111:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103114:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103117:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  10311a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10311d:	c1 e8 02             	shr    $0x2,%eax
  103120:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103122:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103125:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103128:	89 d7                	mov    %edx,%edi
  10312a:	89 c6                	mov    %eax,%esi
  10312c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10312e:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103131:	83 e1 03             	and    $0x3,%ecx
  103134:	74 02                	je     103138 <memmove+0x53>
  103136:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103138:	89 f0                	mov    %esi,%eax
  10313a:	89 fa                	mov    %edi,%edx
  10313c:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  10313f:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103142:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103145:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103148:	eb 36                	jmp    103180 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  10314a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10314d:	8d 50 ff             	lea    -0x1(%eax),%edx
  103150:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103153:	01 c2                	add    %eax,%edx
  103155:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103158:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10315b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10315e:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103161:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103164:	89 c1                	mov    %eax,%ecx
  103166:	89 d8                	mov    %ebx,%eax
  103168:	89 d6                	mov    %edx,%esi
  10316a:	89 c7                	mov    %eax,%edi
  10316c:	fd                   	std    
  10316d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10316f:	fc                   	cld    
  103170:	89 f8                	mov    %edi,%eax
  103172:	89 f2                	mov    %esi,%edx
  103174:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103177:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10317a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10317d:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103180:	83 c4 30             	add    $0x30,%esp
  103183:	5b                   	pop    %ebx
  103184:	5e                   	pop    %esi
  103185:	5f                   	pop    %edi
  103186:	5d                   	pop    %ebp
  103187:	c3                   	ret    

00103188 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103188:	55                   	push   %ebp
  103189:	89 e5                	mov    %esp,%ebp
  10318b:	57                   	push   %edi
  10318c:	56                   	push   %esi
  10318d:	83 ec 20             	sub    $0x20,%esp
  103190:	8b 45 08             	mov    0x8(%ebp),%eax
  103193:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103196:	8b 45 0c             	mov    0xc(%ebp),%eax
  103199:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10319c:	8b 45 10             	mov    0x10(%ebp),%eax
  10319f:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1031a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031a5:	c1 e8 02             	shr    $0x2,%eax
  1031a8:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1031aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1031ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031b0:	89 d7                	mov    %edx,%edi
  1031b2:	89 c6                	mov    %eax,%esi
  1031b4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1031b6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1031b9:	83 e1 03             	and    $0x3,%ecx
  1031bc:	74 02                	je     1031c0 <memcpy+0x38>
  1031be:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031c0:	89 f0                	mov    %esi,%eax
  1031c2:	89 fa                	mov    %edi,%edx
  1031c4:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1031c7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1031ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1031cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1031d0:	83 c4 20             	add    $0x20,%esp
  1031d3:	5e                   	pop    %esi
  1031d4:	5f                   	pop    %edi
  1031d5:	5d                   	pop    %ebp
  1031d6:	c3                   	ret    

001031d7 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1031d7:	55                   	push   %ebp
  1031d8:	89 e5                	mov    %esp,%ebp
  1031da:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1031dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1031e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1031e3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031e6:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1031e9:	eb 30                	jmp    10321b <memcmp+0x44>
        if (*s1 != *s2) {
  1031eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031ee:	0f b6 10             	movzbl (%eax),%edx
  1031f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1031f4:	0f b6 00             	movzbl (%eax),%eax
  1031f7:	38 c2                	cmp    %al,%dl
  1031f9:	74 18                	je     103213 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1031fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1031fe:	0f b6 00             	movzbl (%eax),%eax
  103201:	0f b6 d0             	movzbl %al,%edx
  103204:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103207:	0f b6 00             	movzbl (%eax),%eax
  10320a:	0f b6 c0             	movzbl %al,%eax
  10320d:	29 c2                	sub    %eax,%edx
  10320f:	89 d0                	mov    %edx,%eax
  103211:	eb 1a                	jmp    10322d <memcmp+0x56>
        }
        s1 ++, s2 ++;
  103213:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103217:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  10321b:	8b 45 10             	mov    0x10(%ebp),%eax
  10321e:	8d 50 ff             	lea    -0x1(%eax),%edx
  103221:	89 55 10             	mov    %edx,0x10(%ebp)
  103224:	85 c0                	test   %eax,%eax
  103226:	75 c3                	jne    1031eb <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103228:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10322d:	c9                   	leave  
  10322e:	c3                   	ret    
