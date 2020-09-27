
.text
.global _start
_start:

	/*关闭看门狗，ldr是伪指令*/
	ldr r0,=0x53000000
	ldr r1,=0
	str r1,[r0] 
	
	/*判断是nand还是nor*/
	mov r0,#0
	ldr r1,[r0]  //读出原来的值备份一下
	str r0,[r0] //0写入0地址
	ldr r2,[r0]	 //再读取出来
	cmp r1,r2
	ldr sp, =0x40000000+4096
	moveq sp, #4096
	streq r1, [r0]

    /*跳转执行main并将返回地址保存起来，返回地址就在下面那的语句*/
	bl main()

halt:
	b halt
		
  














