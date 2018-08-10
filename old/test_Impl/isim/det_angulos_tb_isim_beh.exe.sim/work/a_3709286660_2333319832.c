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
static const char *ng0 = "C:/Users/Martin/Documents/SistDig/SistDig-TP4/testers/det_angulos_tb.vhd";
extern char *IEEE_P_2592010699;
extern char *STD_STANDARD;
extern char *IEEE_P_1242562249;
extern char *FLOATFIXLIB_P_0618294350;

char *floatfixlib_p_0618294350_sub_3281882406_3517329569(char *, char *, char *, char *, int , unsigned char , unsigned char );
char *floatfixlib_p_0618294350_sub_3314382318_3517329569(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_2271993008_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );


static void work_a_3709286660_2333319832_p_0(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(49, ng0);

LAB3:    t1 = (5 * 1000LL);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 8856);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t10 = (t0 + 8856);
    xsi_driver_intertial_reject(t10, t1, t1);

LAB2:    t11 = (t0 + 8696);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int64 t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int64 t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int64 t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    int64 t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(51, ng0);

LAB3:    t1 = (20 * 1000LL);
    t2 = (t0 + 8920);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (25 * 1000LL);
    t8 = (t0 + 8920);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t8, 0U, 1, t7);
    t13 = (100 * 1000LL);
    t14 = (t0 + 8920);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_subsequent_trans_delta(t14, 0U, 1, t13);
    t19 = (105 * 1000LL);
    t20 = (t0 + 8920);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t20, 0U, 1, t19);
    t25 = (160 * 1000LL);
    t26 = (t0 + 8920);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    *((unsigned char *)t30) = (unsigned char)3;
    xsi_driver_subsequent_trans_delta(t26, 0U, 1, t25);
    t31 = (165 * 1000LL);
    t32 = (t0 + 8920);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    *((unsigned char *)t36) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t32, 0U, 1, t31);
    t37 = (t0 + 8920);
    xsi_driver_intertial_reject(t37, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_2(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int64 t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int64 t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int64 t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    int64 t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t1 = (40 * 1000LL);
    t2 = (t0 + 8984);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (45 * 1000LL);
    t8 = (t0 + 8984);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t8, 0U, 1, t7);
    t13 = (100 * 1000LL);
    t14 = (t0 + 8984);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_subsequent_trans_delta(t14, 0U, 1, t13);
    t19 = (115 * 1000LL);
    t20 = (t0 + 8984);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t20, 0U, 1, t19);
    t25 = (220 * 1000LL);
    t26 = (t0 + 8984);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    *((unsigned char *)t30) = (unsigned char)3;
    xsi_driver_subsequent_trans_delta(t26, 0U, 1, t25);
    t31 = (225 * 1000LL);
    t32 = (t0 + 8984);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    *((unsigned char *)t36) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t32, 0U, 1, t31);
    t37 = (t0 + 8984);
    xsi_driver_intertial_reject(t37, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_3(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int64 t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    int64 t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    int64 t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    int64 t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (60 * 1000LL);
    t2 = (t0 + 9048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (65 * 1000LL);
    t8 = (t0 + 9048);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t8, 0U, 1, t7);
    t13 = (100 * 1000LL);
    t14 = (t0 + 9048);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_subsequent_trans_delta(t14, 0U, 1, t13);
    t19 = (105 * 1000LL);
    t20 = (t0 + 9048);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    *((unsigned char *)t24) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t20, 0U, 1, t19);
    t25 = (160 * 1000LL);
    t26 = (t0 + 9048);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    *((unsigned char *)t30) = (unsigned char)3;
    xsi_driver_subsequent_trans_delta(t26, 0U, 1, t25);
    t31 = (175 * 1000LL);
    t32 = (t0 + 9048);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    *((unsigned char *)t36) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t32, 0U, 1, t31);
    t37 = (t0 + 9048);
    xsi_driver_intertial_reject(t37, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_4(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(54, ng0);

LAB3:    t1 = (150 * 1000LL);
    t2 = (t0 + 9112);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 9112);
    xsi_driver_intertial_reject(t7, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_5(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(57, ng0);

LAB3:    t1 = (105 * 1000LL);
    t2 = (t0 + 9176);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 9176);
    xsi_driver_intertial_reject(t7, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_6(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(58, ng0);

LAB3:    t1 = (200 * 1000LL);
    t2 = (t0 + 9240);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (205 * 1000LL);
    t8 = (t0 + 9240);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_subsequent_trans_delta(t8, 0U, 1, t7);
    t13 = (t0 + 9240);
    xsi_driver_intertial_reject(t13, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_7(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(59, ng0);

LAB3:    t1 = (240 * 1000LL);
    t2 = (t0 + 9304);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 9304);
    xsi_driver_intertial_reject(t7, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_8(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(61, ng0);

LAB3:    t1 = (260 * 1000LL);
    t2 = (t0 + 9368);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 9368);
    xsi_driver_intertial_reject(t7, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_9(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(71, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2792U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 9432);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 8712);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_10(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(84, ng0);

LAB3:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t1 = (t0 + 9496);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 8728);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_11(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(85, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t1 = (t0 + 9560);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 8744);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_12(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(86, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t1 = (t0 + 9624);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 8760);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3709286660_2333319832_p_13(char *t0)
{
    char t8[16];
    char t10[16];
    char t11[16];
    char t27[16];
    char t29[16];
    char t36[16];
    char t38[16];
    char t42[16];
    char t43[16];
    char t44[16];
    char t60[16];
    char t65[16];
    char t67[16];
    char t71[16];
    char t72[16];
    char t73[16];
    char t89[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t9;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    char *t21;
    unsigned char t22;
    int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t28;
    char *t30;
    char *t31;
    int t32;
    unsigned int t33;
    char *t35;
    char *t37;
    char *t39;
    char *t40;
    int t41;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    unsigned char t53;
    char *t54;
    unsigned char t55;
    int t56;
    char *t57;
    char *t58;
    char *t59;
    char *t61;
    char *t62;
    char *t64;
    char *t66;
    char *t68;
    char *t69;
    int t70;
    char *t74;
    char *t75;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    unsigned char t82;
    char *t83;
    unsigned char t84;
    int t85;
    char *t86;
    char *t87;
    char *t88;
    char *t90;
    char *t91;
    unsigned int t92;
    unsigned int t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;
    unsigned int t99;
    unsigned int t100;

LAB0:    xsi_set_current_line(91, ng0);
    t1 = (t0 + 1472U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8776);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(92, ng0);
    t3 = (t0 + 3752U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(93, ng0);
    t3 = (t0 + 14336);
    t9 = ((STD_STANDARD) + 384);
    t12 = (t0 + 3272U);
    t13 = *((char **)t12);
    t12 = (t0 + 3280U);
    t14 = *((char **)t12);
    t15 = (t0 + 4168U);
    t16 = *((char **)t15);
    t15 = (t0 + 4176);
    t15 = *((char **)t15);
    t17 = floatfixlib_p_0618294350_sub_3314382318_3517329569(FLOATFIXLIB_P_0618294350, t11, t13, t14, t16, t15);
    t18 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t19 = *((char **)t18);
    t20 = *((unsigned char *)t19);
    t18 = ((FLOATFIXLIB_P_0618294350) + 1648U);
    t21 = *((char **)t18);
    t22 = *((unsigned char *)t21);
    t18 = floatfixlib_p_0618294350_sub_3281882406_3517329569(FLOATFIXLIB_P_0618294350, t10, t17, t11, 32, t20, t22);
    t23 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t18, t10);
    t24 = xsi_int_to_mem(t23);
    t25 = xsi_string_variable_get_image(t8, t9, t24);
    t28 = ((STD_STANDARD) + 1008);
    t30 = (t29 + 0U);
    t31 = (t30 + 0U);
    *((int *)t31) = 1;
    t31 = (t30 + 4U);
    *((int *)t31) = 6;
    t31 = (t30 + 8U);
    *((int *)t31) = 1;
    t32 = (6 - 1);
    t33 = (t32 * 1);
    t33 = (t33 + 1);
    t31 = (t30 + 12U);
    *((unsigned int *)t31) = t33;
    t26 = xsi_base_array_concat(t26, t27, t28, (char)97, t3, t29, (char)97, t25, t8, (char)101);
    t31 = (t0 + 14342);
    t37 = ((STD_STANDARD) + 1008);
    t39 = (t38 + 0U);
    t40 = (t39 + 0U);
    *((int *)t40) = 1;
    t40 = (t39 + 4U);
    *((int *)t40) = 7;
    t40 = (t39 + 8U);
    *((int *)t40) = 1;
    t41 = (7 - 1);
    t33 = (t41 * 1);
    t33 = (t33 + 1);
    t40 = (t39 + 12U);
    *((unsigned int *)t40) = t33;
    t35 = xsi_base_array_concat(t35, t36, t37, (char)97, t26, t27, (char)97, t31, t38, (char)101);
    t40 = ((STD_STANDARD) + 384);
    t45 = (t0 + 3432U);
    t46 = *((char **)t45);
    t45 = (t0 + 3440U);
    t47 = *((char **)t45);
    t48 = (t0 + 4168U);
    t49 = *((char **)t48);
    t48 = (t0 + 4176);
    t48 = *((char **)t48);
    t50 = floatfixlib_p_0618294350_sub_3314382318_3517329569(FLOATFIXLIB_P_0618294350, t44, t46, t47, t49, t48);
    t51 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t52 = *((char **)t51);
    t53 = *((unsigned char *)t52);
    t51 = ((FLOATFIXLIB_P_0618294350) + 1648U);
    t54 = *((char **)t51);
    t55 = *((unsigned char *)t54);
    t51 = floatfixlib_p_0618294350_sub_3281882406_3517329569(FLOATFIXLIB_P_0618294350, t43, t50, t44, 32, t53, t55);
    t56 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t51, t43);
    t57 = xsi_int_to_mem(t56);
    t58 = xsi_string_variable_get_image(t42, t40, t57);
    t61 = ((STD_STANDARD) + 1008);
    t59 = xsi_base_array_concat(t59, t60, t61, (char)97, t35, t36, (char)97, t58, t42, (char)101);
    t62 = (t0 + 14349);
    t66 = ((STD_STANDARD) + 1008);
    t68 = (t67 + 0U);
    t69 = (t68 + 0U);
    *((int *)t69) = 1;
    t69 = (t68 + 4U);
    *((int *)t69) = 7;
    t69 = (t68 + 8U);
    *((int *)t69) = 1;
    t70 = (7 - 1);
    t33 = (t70 * 1);
    t33 = (t33 + 1);
    t69 = (t68 + 12U);
    *((unsigned int *)t69) = t33;
    t64 = xsi_base_array_concat(t64, t65, t66, (char)97, t59, t60, (char)97, t62, t67, (char)101);
    t69 = ((STD_STANDARD) + 384);
    t74 = (t0 + 3592U);
    t75 = *((char **)t74);
    t74 = (t0 + 3600U);
    t76 = *((char **)t74);
    t77 = (t0 + 4168U);
    t78 = *((char **)t77);
    t77 = (t0 + 4176);
    t77 = *((char **)t77);
    t79 = floatfixlib_p_0618294350_sub_3314382318_3517329569(FLOATFIXLIB_P_0618294350, t73, t75, t76, t78, t77);
    t80 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t81 = *((char **)t80);
    t82 = *((unsigned char *)t81);
    t80 = ((FLOATFIXLIB_P_0618294350) + 1648U);
    t83 = *((char **)t80);
    t84 = *((unsigned char *)t83);
    t80 = floatfixlib_p_0618294350_sub_3281882406_3517329569(FLOATFIXLIB_P_0618294350, t72, t79, t73, 32, t82, t84);
    t85 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t80, t72);
    t86 = xsi_int_to_mem(t85);
    t87 = xsi_string_variable_get_image(t71, t69, t86);
    t90 = ((STD_STANDARD) + 1008);
    t88 = xsi_base_array_concat(t88, t89, t90, (char)97, t64, t65, (char)97, t87, t71, (char)101);
    t91 = (t8 + 12U);
    t33 = *((unsigned int *)t91);
    t92 = (6U + t33);
    t93 = (t92 + 7U);
    t94 = (t42 + 12U);
    t95 = *((unsigned int *)t94);
    t96 = (t93 + t95);
    t97 = (t96 + 7U);
    t98 = (t71 + 12U);
    t99 = *((unsigned int *)t98);
    t100 = (t97 + t99);
    xsi_report(t88, t100, (unsigned char)0);
    goto LAB6;

}


extern void work_a_3709286660_2333319832_init()
{
	static char *pe[] = {(void *)work_a_3709286660_2333319832_p_0,(void *)work_a_3709286660_2333319832_p_1,(void *)work_a_3709286660_2333319832_p_2,(void *)work_a_3709286660_2333319832_p_3,(void *)work_a_3709286660_2333319832_p_4,(void *)work_a_3709286660_2333319832_p_5,(void *)work_a_3709286660_2333319832_p_6,(void *)work_a_3709286660_2333319832_p_7,(void *)work_a_3709286660_2333319832_p_8,(void *)work_a_3709286660_2333319832_p_9,(void *)work_a_3709286660_2333319832_p_10,(void *)work_a_3709286660_2333319832_p_11,(void *)work_a_3709286660_2333319832_p_12,(void *)work_a_3709286660_2333319832_p_13};
	xsi_register_didat("work_a_3709286660_2333319832", "isim/det_angulos_tb_isim_beh.exe.sim/work/a_3709286660_2333319832.didat");
	xsi_register_executes(pe);
}
