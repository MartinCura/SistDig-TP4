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
static const char *ng0 = "C:/Users/Martin/Documents/SistDig/SistDig-TP4/det_angulos.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_0200094193;
extern char *FLOATFIXLIB_P_0618294350;

char *floatfixlib_p_0618294350_sub_3314238570_3517329569(char *, char *, char *, char *, char *, char *);
char *floatfixlib_p_0618294350_sub_3314310444_3517329569(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1377579441_3378920104_p_0(char *t0)
{
    char t15[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    unsigned char t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5856);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB9:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(41, ng0);
    t3 = ((WORK_P_0200094193) + 1648U);
    t7 = *((char **)t3);
    t3 = (t0 + 5984);
    t8 = (t3 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t7, 32U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(42, ng0);
    t1 = ((WORK_P_0200094193) + 1648U);
    t3 = *((char **)t1);
    t1 = (t0 + 6048);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 32U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(43, ng0);
    t1 = ((WORK_P_0200094193) + 1648U);
    t3 = *((char **)t1);
    t1 = (t0 + 6112);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 32U);
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 3808U);
    t4 = *((char **)t1);
    t12 = *((int *)t4);
    t13 = (t12 + 1);
    t1 = (t0 + 3808U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = t13;
    xsi_set_current_line(46, ng0);
    t1 = (t0 + 3808U);
    t3 = *((char **)t1);
    t12 = *((int *)t3);
    t2 = (t12 == 1);
    if (t2 != 0)
        goto LAB10;

LAB12:
LAB11:    goto LAB6;

LAB10:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 3808U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1512U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB13;

LAB15:
LAB14:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1672U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB23;

LAB25:
LAB24:    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB33;

LAB35:
LAB34:    goto LAB11;

LAB13:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1992U);
    t4 = *((char **)t1);
    t6 = *((unsigned char *)t4);
    t14 = (t6 == (unsigned char)3);
    if (t14 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 2960U);
    t4 = *((char **)t1);
    t7 = (t0 + 3688U);
    t8 = *((char **)t7);
    t7 = (t0 + 3696);
    t7 = *((char **)t7);
    t9 = floatfixlib_p_0618294350_sub_3314238570_3517329569(FLOATFIXLIB_P_0618294350, t15, t3, t4, t8, t7);
    t10 = (t15 + 12U);
    t17 = *((unsigned int *)t10);
    t18 = (1U * t17);
    t2 = (32U != t18);
    if (t2 == 1)
        goto LAB21;

LAB22:    t11 = (t0 + 5984);
    t16 = (t11 + 56U);
    t20 = *((char **)t16);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t9, 32U);
    xsi_driver_first_trans_fast(t11);

LAB17:    goto LAB14;

LAB16:    xsi_set_current_line(50, ng0);
    t1 = (t0 + 2952U);
    t7 = *((char **)t1);
    t1 = (t0 + 2960U);
    t8 = *((char **)t1);
    t9 = (t0 + 3688U);
    t10 = *((char **)t9);
    t9 = (t0 + 3696);
    t9 = *((char **)t9);
    t11 = floatfixlib_p_0618294350_sub_3314310444_3517329569(FLOATFIXLIB_P_0618294350, t15, t7, t8, t10, t9);
    t16 = (t15 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (32U != t18);
    if (t19 == 1)
        goto LAB19;

LAB20:    t20 = (t0 + 5984);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 32U);
    xsi_driver_first_trans_fast(t20);
    goto LAB17;

LAB19:    xsi_size_not_matching(32U, t18, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(32U, t18, 0);
    goto LAB22;

LAB23:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 2152U);
    t4 = *((char **)t1);
    t6 = *((unsigned char *)t4);
    t14 = (t6 == (unsigned char)3);
    if (t14 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t1 = (t0 + 3120U);
    t4 = *((char **)t1);
    t7 = (t0 + 3688U);
    t8 = *((char **)t7);
    t7 = (t0 + 3696);
    t7 = *((char **)t7);
    t9 = floatfixlib_p_0618294350_sub_3314238570_3517329569(FLOATFIXLIB_P_0618294350, t15, t3, t4, t8, t7);
    t10 = (t15 + 12U);
    t17 = *((unsigned int *)t10);
    t18 = (1U * t17);
    t2 = (32U != t18);
    if (t2 == 1)
        goto LAB31;

LAB32:    t11 = (t0 + 6048);
    t16 = (t11 + 56U);
    t20 = *((char **)t16);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t9, 32U);
    xsi_driver_first_trans_fast(t11);

LAB27:    goto LAB24;

LAB26:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 3112U);
    t7 = *((char **)t1);
    t1 = (t0 + 3120U);
    t8 = *((char **)t1);
    t9 = (t0 + 3688U);
    t10 = *((char **)t9);
    t9 = (t0 + 3696);
    t9 = *((char **)t9);
    t11 = floatfixlib_p_0618294350_sub_3314310444_3517329569(FLOATFIXLIB_P_0618294350, t15, t7, t8, t10, t9);
    t16 = (t15 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (32U != t18);
    if (t19 == 1)
        goto LAB29;

LAB30:    t20 = (t0 + 6048);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 32U);
    xsi_driver_first_trans_fast(t20);
    goto LAB27;

LAB29:    xsi_size_not_matching(32U, t18, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(32U, t18, 0);
    goto LAB32;

LAB33:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 2312U);
    t4 = *((char **)t1);
    t6 = *((unsigned char *)t4);
    t14 = (t6 == (unsigned char)3);
    if (t14 != 0)
        goto LAB36;

LAB38:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 3272U);
    t3 = *((char **)t1);
    t1 = (t0 + 3280U);
    t4 = *((char **)t1);
    t7 = (t0 + 3688U);
    t8 = *((char **)t7);
    t7 = (t0 + 3696);
    t7 = *((char **)t7);
    t9 = floatfixlib_p_0618294350_sub_3314238570_3517329569(FLOATFIXLIB_P_0618294350, t15, t3, t4, t8, t7);
    t10 = (t15 + 12U);
    t17 = *((unsigned int *)t10);
    t18 = (1U * t17);
    t2 = (32U != t18);
    if (t2 == 1)
        goto LAB41;

LAB42:    t11 = (t0 + 6112);
    t16 = (t11 + 56U);
    t20 = *((char **)t16);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t9, 32U);
    xsi_driver_first_trans_fast(t11);

LAB37:    goto LAB34;

LAB36:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 3272U);
    t7 = *((char **)t1);
    t1 = (t0 + 3280U);
    t8 = *((char **)t1);
    t9 = (t0 + 3688U);
    t10 = *((char **)t9);
    t9 = (t0 + 3696);
    t9 = *((char **)t9);
    t11 = floatfixlib_p_0618294350_sub_3314310444_3517329569(FLOATFIXLIB_P_0618294350, t15, t7, t8, t10, t9);
    t16 = (t15 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (32U != t18);
    if (t19 == 1)
        goto LAB39;

LAB40:    t20 = (t0 + 6112);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t11, 32U);
    xsi_driver_first_trans_fast(t20);
    goto LAB37;

LAB39:    xsi_size_not_matching(32U, t18, 0);
    goto LAB40;

LAB41:    xsi_size_not_matching(32U, t18, 0);
    goto LAB42;

}

static void work_a_1377579441_3378920104_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(74, ng0);

LAB3:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 6176);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5872);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1377579441_3378920104_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(75, ng0);

LAB3:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 6240);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5888);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_1377579441_3378920104_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(76, ng0);

LAB3:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 6304);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 5904);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1377579441_3378920104_init()
{
	static char *pe[] = {(void *)work_a_1377579441_3378920104_p_0,(void *)work_a_1377579441_3378920104_p_1,(void *)work_a_1377579441_3378920104_p_2,(void *)work_a_1377579441_3378920104_p_3};
	xsi_register_didat("work_a_1377579441_3378920104", "isim/det_angulos_tb_isim_beh.exe.sim/work/a_1377579441_3378920104.didat");
	xsi_register_executes(pe);
}
