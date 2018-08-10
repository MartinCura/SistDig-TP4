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
static const char *ng0 = "C:/Users/Martin/Documents/SistDig/SistDig-TP4/testers/cordic_tb.vhd";
extern char *IEEE_P_2592010699;
extern char *FLOATFIXLIB_P_0618294350;
extern char *WORK_P_0200094193;
extern char *STD_STANDARD;
extern char *IEEE_P_1242562249;

char *floatfixlib_p_0618294350_sub_2986753056_3517329569(char *, char *, double , int , int , unsigned char , unsigned char );
char *floatfixlib_p_0618294350_sub_3064212228_3517329569(char *, char *, int , int , int , unsigned char );
char *floatfixlib_p_0618294350_sub_3281882406_3517329569(char *, char *, char *, char *, int , unsigned char , unsigned char );
char *floatfixlib_p_0618294350_sub_3419135235_3517329569(char *, char *, char *, char *, int );
char *floatfixlib_p_0618294350_sub_3419314920_3517329569(char *, char *, char *, char *, int );
char *floatfixlib_p_0618294350_sub_3466505822_3517329569(char *, char *, char *, char *);
char *floatfixlib_p_0618294350_sub_3936075399_3517329569(char *, char *, int , char *, char *);
int ieee_p_1242562249_sub_2271993008_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *work_p_0200094193_sub_2235713058_2700004642(char *, char *, char *);


static void work_a_0447393209_0949611665_p_0(char *t0)
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

LAB0:    xsi_set_current_line(28, ng0);

LAB3:    t1 = (5 * 1000LL);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 5720);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t10 = (t0 + 5720);
    xsi_driver_intertial_reject(t10, t1, t1);

LAB2:    t11 = (t0 + 5576);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0447393209_0949611665_p_1(char *t0)
{
    char t2[16];
    char t16[16];
    char t30[16];
    char t31[16];
    char t53[16];
    char t54[16];
    char t69[16];
    char t70[16];
    char t85[16];
    char t99[16];
    int64 t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int64 t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    int64 t29;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned char t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    int64 t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    char *t50;
    char *t51;
    int64 t52;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    char *t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    int64 t68;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned char t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    int64 t84;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    unsigned char t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;
    char *t97;
    int64 t98;
    char *t100;
    char *t101;
    int t102;
    char *t103;
    int t104;
    char *t105;
    unsigned char t106;
    char *t107;
    unsigned char t108;
    unsigned char t109;
    char *t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;

LAB0:    xsi_set_current_line(30, ng0);

LAB3:    t1 = (49 * 1000LL);
    t3 = ((WORK_P_0200094193) + 1408U);
    t4 = *((char **)t3);
    t3 = ((WORK_P_0200094193) + 1416);
    t3 = *((char **)t3);
    t5 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t2, t4, t3, 4);
    t6 = (t2 + 12U);
    t7 = *((unsigned int *)t6);
    t8 = (1U * t7);
    t9 = (32U != t8);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 5784);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t5, 32U);
    xsi_driver_first_trans_delta(t10, 0U, 32U, t1);
    t15 = (100 * 1000LL);
    t17 = ((WORK_P_0200094193) + 1408U);
    t18 = *((char **)t17);
    t17 = ((WORK_P_0200094193) + 1416);
    t17 = *((char **)t17);
    t19 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t16, t18, t17, 2);
    t20 = (t16 + 12U);
    t21 = *((unsigned int *)t20);
    t22 = (1U * t21);
    t23 = (32U != t22);
    if (t23 == 1)
        goto LAB7;

LAB8:    t24 = (t0 + 5784);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t19, 32U);
    xsi_driver_subsequent_trans_delta(t24, 0U, 32U, t15);
    t29 = (150 * 1000LL);
    t32 = ((WORK_P_0200094193) + 1408U);
    t33 = *((char **)t32);
    t32 = ((WORK_P_0200094193) + 1416);
    t32 = *((char **)t32);
    t34 = floatfixlib_p_0618294350_sub_3936075399_3517329569(FLOATFIXLIB_P_0618294350, t31, 3, t33, t32);
    t35 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t30, t34, t31, 4);
    t36 = (t30 + 12U);
    t37 = *((unsigned int *)t36);
    t38 = (1U * t37);
    t39 = (32U != t38);
    if (t39 == 1)
        goto LAB9;

LAB10:    t40 = (t0 + 5784);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    memcpy(t44, t35, 32U);
    xsi_driver_subsequent_trans_delta(t40, 0U, 32U, t29);
    t45 = (200 * 1000LL);
    t46 = ((WORK_P_0200094193) + 1408U);
    t47 = *((char **)t46);
    t46 = (t0 + 5784);
    t48 = (t46 + 56U);
    t49 = *((char **)t48);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    memcpy(t51, t47, 32U);
    xsi_driver_subsequent_trans_delta(t46, 0U, 32U, t45);
    t52 = (250 * 1000LL);
    t55 = ((WORK_P_0200094193) + 1408U);
    t56 = *((char **)t55);
    t55 = ((WORK_P_0200094193) + 1416);
    t55 = *((char **)t55);
    t57 = floatfixlib_p_0618294350_sub_3936075399_3517329569(FLOATFIXLIB_P_0618294350, t54, 3, t56, t55);
    t58 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t53, t57, t54, 2);
    t59 = (t53 + 12U);
    t60 = *((unsigned int *)t59);
    t61 = (1U * t60);
    t62 = (32U != t61);
    if (t62 == 1)
        goto LAB11;

LAB12:    t63 = (t0 + 5784);
    t64 = (t63 + 56U);
    t65 = *((char **)t64);
    t66 = (t65 + 56U);
    t67 = *((char **)t66);
    memcpy(t67, t58, 32U);
    xsi_driver_subsequent_trans_delta(t63, 0U, 32U, t52);
    t68 = (300 * 1000LL);
    t71 = ((WORK_P_0200094193) + 1408U);
    t72 = *((char **)t71);
    t71 = ((WORK_P_0200094193) + 1416);
    t71 = *((char **)t71);
    t73 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t70, t72, t71, 2);
    t74 = floatfixlib_p_0618294350_sub_3466505822_3517329569(FLOATFIXLIB_P_0618294350, t69, t73, t70);
    t75 = (t69 + 12U);
    t76 = *((unsigned int *)t75);
    t77 = (1U * t76);
    t78 = (32U != t77);
    if (t78 == 1)
        goto LAB13;

LAB14:    t79 = (t0 + 5784);
    t80 = (t79 + 56U);
    t81 = *((char **)t80);
    t82 = (t81 + 56U);
    t83 = *((char **)t82);
    memcpy(t83, t74, 32U);
    xsi_driver_subsequent_trans_delta(t79, 0U, 32U, t68);
    t84 = (350 * 1000LL);
    t86 = ((WORK_P_0200094193) + 1408U);
    t87 = *((char **)t86);
    t86 = ((WORK_P_0200094193) + 1416);
    t86 = *((char **)t86);
    t88 = floatfixlib_p_0618294350_sub_3936075399_3517329569(FLOATFIXLIB_P_0618294350, t85, 2, t87, t86);
    t89 = (t85 + 12U);
    t90 = *((unsigned int *)t89);
    t91 = (1U * t90);
    t92 = (32U != t91);
    if (t92 == 1)
        goto LAB15;

LAB16:    t93 = (t0 + 5784);
    t94 = (t93 + 56U);
    t95 = *((char **)t94);
    t96 = (t95 + 56U);
    t97 = *((char **)t96);
    memcpy(t97, t88, 32U);
    xsi_driver_subsequent_trans_delta(t93, 0U, 32U, t84);
    t98 = (400 * 1000LL);
    t100 = ((FLOATFIXLIB_P_0618294350) + 1168U);
    t101 = *((char **)t100);
    t102 = *((int *)t101);
    t100 = ((FLOATFIXLIB_P_0618294350) + 1288U);
    t103 = *((char **)t100);
    t104 = *((int *)t103);
    t100 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t105 = *((char **)t100);
    t106 = *((unsigned char *)t105);
    t100 = ((FLOATFIXLIB_P_0618294350) + 1528U);
    t107 = *((char **)t100);
    t108 = *((unsigned char *)t107);
    t100 = floatfixlib_p_0618294350_sub_2986753056_3517329569(FLOATFIXLIB_P_0618294350, t99, 0.50000000000000000, t102, t104, t106, t108);
    t109 = (32U != 32U);
    if (t109 == 1)
        goto LAB17;

LAB18:    t110 = (t0 + 5784);
    t111 = (t110 + 56U);
    t112 = *((char **)t111);
    t113 = (t112 + 56U);
    t114 = *((char **)t113);
    memcpy(t114, t100, 32U);
    xsi_driver_subsequent_trans_delta(t110, 0U, 32U, t98);
    t115 = (t0 + 5784);
    xsi_driver_intertial_reject(t115, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t8, 0);
    goto LAB6;

LAB7:    xsi_size_not_matching(32U, t22, 0);
    goto LAB8;

LAB9:    xsi_size_not_matching(32U, t38, 0);
    goto LAB10;

LAB11:    xsi_size_not_matching(32U, t61, 0);
    goto LAB12;

LAB13:    xsi_size_not_matching(32U, t77, 0);
    goto LAB14;

LAB15:    xsi_size_not_matching(32U, t91, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB18;

}

static void work_a_0447393209_0949611665_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    unsigned char t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(32, ng0);

LAB3:    t2 = ((FLOATFIXLIB_P_0618294350) + 1168U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ((FLOATFIXLIB_P_0618294350) + 1288U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t7 = *((char **)t2);
    t8 = *((unsigned char *)t7);
    t2 = floatfixlib_p_0618294350_sub_3064212228_3517329569(FLOATFIXLIB_P_0618294350, t1, 1, t4, t6, t8);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t10 = (t10 * 1U);
    t11 = (32U != t10);
    if (t11 == 1)
        goto LAB5;

LAB6:    t12 = (t0 + 5848);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t12);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}

static void work_a_0447393209_0949611665_p_3(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    unsigned char t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(33, ng0);

LAB3:    t2 = ((FLOATFIXLIB_P_0618294350) + 1168U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ((FLOATFIXLIB_P_0618294350) + 1288U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t7 = *((char **)t2);
    t8 = *((unsigned char *)t7);
    t2 = floatfixlib_p_0618294350_sub_3064212228_3517329569(FLOATFIXLIB_P_0618294350, t1, 2, t4, t6, t8);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t10 = (t10 * 1U);
    t11 = (32U != t10);
    if (t11 == 1)
        goto LAB5;

LAB6:    t12 = (t0 + 5912);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t12);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}

static void work_a_0447393209_0949611665_p_4(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    unsigned char t8;
    char *t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(34, ng0);

LAB3:    t2 = ((FLOATFIXLIB_P_0618294350) + 1168U);
    t3 = *((char **)t2);
    t4 = *((int *)t3);
    t2 = ((FLOATFIXLIB_P_0618294350) + 1288U);
    t5 = *((char **)t2);
    t6 = *((int *)t5);
    t2 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t7 = *((char **)t2);
    t8 = *((unsigned char *)t7);
    t2 = floatfixlib_p_0618294350_sub_3064212228_3517329569(FLOATFIXLIB_P_0618294350, t1, 3, t4, t6, t8);
    t9 = (t1 + 12U);
    t10 = *((unsigned int *)t9);
    t10 = (t10 * 1U);
    t11 = (32U != t10);
    if (t11 == 1)
        goto LAB5;

LAB6:    t12 = (t0 + 5976);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_fast(t12);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}

static void work_a_0447393209_0949611665_p_5(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(36, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 6040);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_delta(t1, 0U, 32U, 0LL);

LAB2:    t7 = (t0 + 5592);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0447393209_0949611665_p_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(37, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6104);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_delta(t1, 32U, 32U, 0LL);

LAB2:    t7 = (t0 + 5608);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0447393209_0949611665_p_7(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = work_p_0200094193_sub_2235713058_2700004642(WORK_P_0200094193, t2, t3);
    t4 = (t0 + 6168);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 64U);
    xsi_driver_first_trans_fast(t4);
    t1 = (t0 + 5624);
    *((int *)t1) = 1;

LAB1:    return;
}

static void work_a_0447393209_0949611665_p_8(char *t0)
{
    char t5[16];
    char t7[16];
    char t8[16];
    char t15[16];
    char t29[16];
    char t31[16];
    char t37[16];
    char t39[16];
    char t43[16];
    char t44[16];
    char t45[16];
    char t51[16];
    char t65[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t6;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned char t22;
    char *t23;
    unsigned char t24;
    int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t30;
    char *t32;
    char *t33;
    int t34;
    char *t36;
    char *t38;
    char *t40;
    char *t41;
    int t42;
    char *t46;
    char *t47;
    int t48;
    unsigned int t49;
    unsigned int t50;
    char *t52;
    char *t53;
    int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    unsigned char t58;
    char *t59;
    unsigned char t60;
    int t61;
    char *t62;
    char *t63;
    char *t64;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5640);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(47, ng0);
    t3 = (t0 + 9217);
    t6 = ((STD_STANDARD) + 384);
    t9 = (t0 + 1992U);
    t10 = *((char **)t9);
    t11 = (1 - 1);
    t12 = (t11 * 1);
    t13 = (32U * t12);
    t14 = (0 + t13);
    t9 = (t10 + t14);
    t16 = (t15 + 0U);
    t17 = (t16 + 0U);
    *((int *)t17) = 8;
    t17 = (t16 + 4U);
    *((int *)t17) = -23;
    t17 = (t16 + 8U);
    *((int *)t17) = -1;
    t18 = (-23 - 8);
    t19 = (t18 * -1);
    t19 = (t19 + 1);
    t17 = (t16 + 12U);
    *((unsigned int *)t17) = t19;
    t17 = floatfixlib_p_0618294350_sub_3419135235_3517329569(FLOATFIXLIB_P_0618294350, t8, t9, t15, 1000);
    t20 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t21 = *((char **)t20);
    t22 = *((unsigned char *)t21);
    t20 = ((FLOATFIXLIB_P_0618294350) + 1648U);
    t23 = *((char **)t20);
    t24 = *((unsigned char *)t23);
    t20 = floatfixlib_p_0618294350_sub_3281882406_3517329569(FLOATFIXLIB_P_0618294350, t7, t17, t8, 32, t22, t24);
    t25 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t20, t7);
    t26 = xsi_int_to_mem(t25);
    t27 = xsi_string_variable_get_image(t5, t6, t26);
    t30 = ((STD_STANDARD) + 1008);
    t32 = (t31 + 0U);
    t33 = (t32 + 0U);
    *((int *)t33) = 1;
    t33 = (t32 + 4U);
    *((int *)t33) = 7;
    t33 = (t32 + 8U);
    *((int *)t33) = 1;
    t34 = (7 - 1);
    t19 = (t34 * 1);
    t19 = (t19 + 1);
    t33 = (t32 + 12U);
    *((unsigned int *)t33) = t19;
    t28 = xsi_base_array_concat(t28, t29, t30, (char)97, t3, t31, (char)97, t27, t5, (char)101);
    t33 = (t0 + 9224);
    t38 = ((STD_STANDARD) + 1008);
    t40 = (t39 + 0U);
    t41 = (t40 + 0U);
    *((int *)t41) = 1;
    t41 = (t40 + 4U);
    *((int *)t41) = 8;
    t41 = (t40 + 8U);
    *((int *)t41) = 1;
    t42 = (8 - 1);
    t19 = (t42 * 1);
    t19 = (t19 + 1);
    t41 = (t40 + 12U);
    *((unsigned int *)t41) = t19;
    t36 = xsi_base_array_concat(t36, t37, t38, (char)97, t28, t29, (char)97, t33, t39, (char)101);
    t41 = ((STD_STANDARD) + 384);
    t46 = (t0 + 1992U);
    t47 = *((char **)t46);
    t48 = (2 - 1);
    t19 = (t48 * 1);
    t49 = (32U * t19);
    t50 = (0 + t49);
    t46 = (t47 + t50);
    t52 = (t51 + 0U);
    t53 = (t52 + 0U);
    *((int *)t53) = 8;
    t53 = (t52 + 4U);
    *((int *)t53) = -23;
    t53 = (t52 + 8U);
    *((int *)t53) = -1;
    t54 = (-23 - 8);
    t55 = (t54 * -1);
    t55 = (t55 + 1);
    t53 = (t52 + 12U);
    *((unsigned int *)t53) = t55;
    t53 = floatfixlib_p_0618294350_sub_3419135235_3517329569(FLOATFIXLIB_P_0618294350, t45, t46, t51, 1000);
    t56 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t57 = *((char **)t56);
    t58 = *((unsigned char *)t57);
    t56 = ((FLOATFIXLIB_P_0618294350) + 1648U);
    t59 = *((char **)t56);
    t60 = *((unsigned char *)t59);
    t56 = floatfixlib_p_0618294350_sub_3281882406_3517329569(FLOATFIXLIB_P_0618294350, t44, t53, t45, 32, t58, t60);
    t61 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t56, t44);
    t62 = xsi_int_to_mem(t61);
    t63 = xsi_string_variable_get_image(t43, t41, t62);
    t66 = ((STD_STANDARD) + 1008);
    t64 = xsi_base_array_concat(t64, t65, t66, (char)97, t36, t37, (char)97, t63, t43, (char)101);
    t67 = (t5 + 12U);
    t55 = *((unsigned int *)t67);
    t68 = (7U + t55);
    t69 = (t68 + 8U);
    t70 = (t43 + 12U);
    t71 = *((unsigned int *)t70);
    t72 = (t69 + t71);
    xsi_report(t64, t72, (unsigned char)0);
    goto LAB3;

}


extern void work_a_0447393209_0949611665_init()
{
	static char *pe[] = {(void *)work_a_0447393209_0949611665_p_0,(void *)work_a_0447393209_0949611665_p_1,(void *)work_a_0447393209_0949611665_p_2,(void *)work_a_0447393209_0949611665_p_3,(void *)work_a_0447393209_0949611665_p_4,(void *)work_a_0447393209_0949611665_p_5,(void *)work_a_0447393209_0949611665_p_6,(void *)work_a_0447393209_0949611665_p_7,(void *)work_a_0447393209_0949611665_p_8};
	xsi_register_didat("work_a_0447393209_0949611665", "isim/cordic_tb_isim_beh.exe.sim/work/a_0447393209_0949611665.didat");
	xsi_register_executes(pe);
}
