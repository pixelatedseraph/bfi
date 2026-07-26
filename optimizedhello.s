	.file	"hello.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	tape(%rip), %rbx
	addb	$8, tape(%rip)
	je	.L3
	.p2align 4,,10
	.p2align 3
.L2:
	movzbl	1(%rbx), %eax
	movzbl	2(%rbx), %esi
	movzbl	3(%rbx), %ecx
	movl	%eax, %edx
	addb	$4, %dl
	movb	%dl, 1(%rbx)
	movzbl	4(%rbx), %edx
	je	.L7
	leal	(%rax,%rax,2), %edi
	leal	8(%rsi,%rax,2), %esi
	addb	5(%rbx), %al
	movb	$0, 1(%rbx)
	addl	$4, %eax
	leal	12(%rdx,%rdi), %edx
	leal	12(%rcx,%rdi), %ecx
	movb	%al, 5(%rbx)
.L7:
	incl	%esi
	incl	%ecx
	leaq	6(%rbx), %rax
	decl	%edx
	incb	6(%rbx)
	movb	%sil, 2(%rbx)
	movb	%cl, 3(%rbx)
	movb	%dl, 4(%rbx)
	je	.L4
	.p2align 3
	.p2align 4,,10
	.p2align 3
.L5:
	decq	%rax
	cmpb	$0, (%rax)
	jne	.L5
.L4:
	decb	-1(%rax)
	leaq	-1(%rax), %rbx
	jne	.L2
.L3:
	movsbl	2(%rbx), %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	movzbl	3(%rbx), %eax
	movq	stdout(%rip), %rsi
	subl	$3, %eax
	movb	%al, 3(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movzbl	3(%rbx), %eax
	movq	stdout(%rip), %rsi
	addl	$7, %eax
	movb	%al, 3(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movsbl	3(%rbx), %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	movzbl	3(%rbx), %eax
	movq	stdout(%rip), %rsi
	addl	$3, %eax
	movb	%al, 3(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movsbl	5(%rbx), %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	movzbl	4(%rbx), %eax
	movq	stdout(%rip), %rsi
	decl	%eax
	movb	%al, 4(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movsbl	3(%rbx), %edi
	movq	stdout(%rip), %rsi
	call	putc@PLT
	movzbl	3(%rbx), %eax
	movq	stdout(%rip), %rsi
	addl	$3, %eax
	movb	%al, 3(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movzbl	3(%rbx), %eax
	movq	stdout(%rip), %rsi
	subl	$6, %eax
	movb	%al, 3(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movzbl	3(%rbx), %eax
	movq	stdout(%rip), %rsi
	subl	$8, %eax
	movb	%al, 3(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movzbl	5(%rbx), %eax
	movq	stdout(%rip), %rsi
	incl	%eax
	movb	%al, 5(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	movzbl	6(%rbx), %eax
	movq	stdout(%rip), %rsi
	addl	$2, %eax
	movb	%al, 6(%rbx)
	movsbl	%al, %edi
	call	putc@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.local	tape
	.comm	tape,30000,32
	.ident	"GCC: (GNU) 16.1.1 20260625"
	.section	.note.GNU-stack,"",@progbits
