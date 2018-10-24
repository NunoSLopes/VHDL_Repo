/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/LIC/Project/Decoder2_3.vhd";



static void work_a_3576543124_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 4230);
    t3 = (t0 + 2752);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(44, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4233);
    t8 = xsi_mem_cmp(t1, t2, 2U);
    if (t8 == 1)
        goto LAB3;

LAB7:    t4 = (t0 + 4235);
    t9 = xsi_mem_cmp(t4, t2, 2U);
    if (t9 == 1)
        goto LAB4;

LAB8:    t6 = (t0 + 4237);
    t10 = xsi_mem_cmp(t6, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB9:
LAB6:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 4239);
    t3 = (t0 + 2752);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 2672);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(45, ng0);
    t11 = (t0 + 2752);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_delta(t11, 2U, 1, 0LL);
    goto LAB2;

LAB4:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 2752);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 1U, 1, 0LL);
    goto LAB2;

LAB5:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 2752);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 0LL);
    goto LAB2;

LAB10:;
}


extern void work_a_3576543124_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3576543124_3212880686_p_0};
	xsi_register_didat("work_a_3576543124_3212880686", "isim/KeyDecoder_tb_isim_beh.exe.sim/work/a_3576543124_3212880686.didat");
	xsi_register_executes(pe);
}
