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
static const char *ng0 = "C:/Users/Martin/Documents/SistDig/SistDig-TP4/testers/rotador3d_tb.vhd";
extern char *IEEE_P_2592010699;
extern char *FLOATFIXLIB_P_0618294350;
extern char *WORK_P_0200094193;
extern char *STD_STANDARD;
extern char *IEEE_P_1242562249;

char *floatfixlib_p_0618294350_sub_3064212228_3517329569(char *, char *, int , int , int , unsigned char );
char *floatfixlib_p_0618294350_sub_3281882406_3517329569(char *, char *, char *, char *, int , unsigned char , unsigned char );
char *floatfixlib_p_0618294350_sub_3419135235_3517329569(char *, char *, char *, char *, int );
char *floatfixlib_p_0618294350_sub_3419314920_3517329569(char *, char *, char *, char *, int );
int ieee_p_1242562249_sub_2271993008_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );


static void work_a_0143837599_2542024188_p_0(char *t0)
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

LAB0:    xsi_set_current_line(85, ng0);

LAB3:    t1 = (5 * 1000LL);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t4);
    t2 = (t0 + 7864);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t10 = (t0 + 7864);
    xsi_driver_intertial_reject(t10, t1, t1);

LAB2:    t11 = (t0 + 7736);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0143837599_2542024188_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(86, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 7928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t7 = (t0 + 7928);
    xsi_driver_intertial_reject(t7, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0143837599_2542024188_p_2(char *t0)
{
    char t12[16];
    char t14[16];
    char *t1;
    char *t2;
    unsigned int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t13;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(88, ng0);

LAB3:    t1 = xsi_get_transient_memory(15U);
    memset(t1, 0, 15U);
    t2 = t1;
    if (-1 == 1)
        goto LAB5;

LAB6:    t3 = 1;

LAB7:    t4 = (t3 - 1);
    t5 = (t4 * 1);
    t6 = (1U * t5);
    t7 = (t2 + t6);
    t8 = (1 - 15);
    t9 = (t8 * -1);
    t9 = (t9 + 1);
    t10 = (1U * t9);
    memset(t7, (unsigned char)2, t10);
    t13 = ((IEEE_P_2592010699) + 4024);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 1;
    t16 = (t15 + 4U);
    *((int *)t16) = 15;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t17 = (15 - 1);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    t11 = xsi_base_array_concat(t11, t12, t13, (char)97, t1, t14, (char)99, (unsigned char)3, (char)101);
    t18 = (15U + 1U);
    t19 = (16U != t18);
    if (t19 == 1)
        goto LAB8;

LAB9:    t16 = (t0 + 7992);
    t20 = (t16 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t11, 16U);
    xsi_driver_first_trans_delta(t16, 0U, 16U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t3 = 15;
    goto LAB7;

LAB8:    xsi_size_not_matching(16U, t18, 0);
    goto LAB9;

}

static void work_a_0143837599_2542024188_p_3(char *t0)
{
    char t12[16];
    char t14[16];
    char *t1;
    char *t2;
    unsigned int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t13;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(89, ng0);

LAB3:    t1 = xsi_get_transient_memory(15U);
    memset(t1, 0, 15U);
    t2 = t1;
    if (-1 == 1)
        goto LAB5;

LAB6:    t3 = 1;

LAB7:    t4 = (t3 - 1);
    t5 = (t4 * 1);
    t6 = (1U * t5);
    t7 = (t2 + t6);
    t8 = (1 - 15);
    t9 = (t8 * -1);
    t9 = (t9 + 1);
    t10 = (1U * t9);
    memset(t7, (unsigned char)2, t10);
    t13 = ((IEEE_P_2592010699) + 4024);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 1;
    t16 = (t15 + 4U);
    *((int *)t16) = 15;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t17 = (15 - 1);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    t11 = xsi_base_array_concat(t11, t12, t13, (char)97, t1, t14, (char)99, (unsigned char)3, (char)101);
    t18 = (15U + 1U);
    t19 = (16U != t18);
    if (t19 == 1)
        goto LAB8;

LAB9:    t16 = (t0 + 8056);
    t20 = (t16 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t11, 16U);
    xsi_driver_first_trans_delta(t16, 16U, 16U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t3 = 15;
    goto LAB7;

LAB8:    xsi_size_not_matching(16U, t18, 0);
    goto LAB9;

}

static void work_a_0143837599_2542024188_p_4(char *t0)
{
    char t12[16];
    char t14[16];
    char *t1;
    char *t2;
    unsigned int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t13;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(90, ng0);

LAB3:    t1 = xsi_get_transient_memory(15U);
    memset(t1, 0, 15U);
    t2 = t1;
    if (-1 == 1)
        goto LAB5;

LAB6:    t3 = 1;

LAB7:    t4 = (t3 - 1);
    t5 = (t4 * 1);
    t6 = (1U * t5);
    t7 = (t2 + t6);
    t8 = (1 - 15);
    t9 = (t8 * -1);
    t9 = (t9 + 1);
    t10 = (1U * t9);
    memset(t7, (unsigned char)2, t10);
    t13 = ((IEEE_P_2592010699) + 4024);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 1;
    t16 = (t15 + 4U);
    *((int *)t16) = 15;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t17 = (15 - 1);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    t11 = xsi_base_array_concat(t11, t12, t13, (char)97, t1, t14, (char)99, (unsigned char)3, (char)101);
    t18 = (15U + 1U);
    t19 = (16U != t18);
    if (t19 == 1)
        goto LAB8;

LAB9:    t16 = (t0 + 8120);
    t20 = (t16 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t11, 16U);
    xsi_driver_first_trans_delta(t16, 32U, 16U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    t3 = 15;
    goto LAB7;

LAB8:    xsi_size_not_matching(16U, t18, 0);
    goto LAB9;

}

static void work_a_0143837599_2542024188_p_5(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(103, ng0);

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
    t9 = (32U != 32U);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 8184);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_delta(t10, 0U, 32U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB6;

}

static void work_a_0143837599_2542024188_p_6(char *t0)
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

LAB0:    xsi_set_current_line(104, ng0);

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

LAB6:    t12 = (t0 + 8248);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_delta(t12, 32U, 32U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}

static void work_a_0143837599_2542024188_p_7(char *t0)
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

LAB0:    xsi_set_current_line(105, ng0);

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

LAB6:    t12 = (t0 + 8312);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t2, 32U);
    xsi_driver_first_trans_delta(t12, 64U, 32U, 0LL);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}

static void work_a_0143837599_2542024188_p_8(char *t0)
{
    char t9[16];
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int64 t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(107, ng0);

LAB3:    t1 = (20 * 1000LL);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    t2 = (t0 + 8376);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (100 * 1000LL);
    t10 = ((WORK_P_0200094193) + 1408U);
    t11 = *((char **)t10);
    t10 = ((WORK_P_0200094193) + 1416);
    t10 = *((char **)t10);
    t12 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t9, t11, t10, 2);
    t13 = (t9 + 12U);
    t14 = *((unsigned int *)t13);
    t15 = (1U * t14);
    t16 = (32U != t15);
    if (t16 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 8376);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t12, 32U);
    xsi_driver_subsequent_trans_delta(t17, 0U, 32U, t8);
    t22 = (t0 + 8376);
    xsi_driver_intertial_reject(t22, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_0143837599_2542024188_p_9(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int64 t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(108, ng0);

LAB3:    t1 = (20 * 1000LL);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    t2 = (t0 + 8440);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (100 * 1000LL);
    t9 = ((WORK_P_0200094193) + 1648U);
    t10 = *((char **)t9);
    t9 = (t0 + 8440);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t10, 32U);
    xsi_driver_subsequent_trans_delta(t9, 0U, 32U, t8);
    t15 = (t0 + 8440);
    xsi_driver_intertial_reject(t15, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0143837599_2542024188_p_10(char *t0)
{
    char t9[16];
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int64 t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    int64 t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(109, ng0);

LAB3:    t1 = (20 * 1000LL);
    t2 = (t0 + 2848U);
    t3 = *((char **)t2);
    t2 = (t0 + 8504);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (100 * 1000LL);
    t10 = ((WORK_P_0200094193) + 1408U);
    t11 = *((char **)t10);
    t10 = ((WORK_P_0200094193) + 1416);
    t10 = *((char **)t10);
    t12 = floatfixlib_p_0618294350_sub_3419314920_3517329569(FLOATFIXLIB_P_0618294350, t9, t11, t10, 2);
    t13 = (t9 + 12U);
    t14 = *((unsigned int *)t13);
    t15 = (1U * t14);
    t16 = (32U != t15);
    if (t16 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 8504);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t12, 32U);
    xsi_driver_subsequent_trans_delta(t17, 0U, 32U, t8);
    t22 = (600 * 1000LL);
    t23 = ((WORK_P_0200094193) + 1408U);
    t24 = *((char **)t23);
    t23 = (t0 + 8504);
    t25 = (t23 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t24, 32U);
    xsi_driver_subsequent_trans_delta(t23, 0U, 32U, t22);
    t29 = (t0 + 8504);
    xsi_driver_intertial_reject(t29, t1, t1);

LAB2:
LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_0143837599_2542024188_p_11(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(127, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = (2 - 1);
    t4 = (t3 * 1);
    t5 = (32U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = (t0 + 8568);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_delta(t7, 0U, 32U, 0LL);

LAB2:    t12 = (t0 + 7752);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0143837599_2542024188_p_12(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(128, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = (3 - 1);
    t4 = (t3 * 1);
    t5 = (32U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = (t0 + 8632);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_delta(t7, 32U, 32U, 0LL);

LAB2:    t12 = (t0 + 7768);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0143837599_2542024188_p_13(char *t0)
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
    char t70[16];
    char t72[16];
    char t76[16];
    char t77[16];
    char t78[16];
    char t84[16];
    char t98[16];
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
    char *t69;
    char *t71;
    char *t73;
    char *t74;
    int t75;
    char *t79;
    char *t80;
    int t81;
    unsigned int t82;
    unsigned int t83;
    char *t85;
    char *t86;
    int t87;
    unsigned int t88;
    char *t89;
    char *t90;
    unsigned char t91;
    char *t92;
    unsigned char t93;
    int t94;
    char *t95;
    char *t96;
    char *t97;
    char *t99;
    char *t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    unsigned int t104;
    unsigned int t105;
    unsigned int t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;

LAB0:    xsi_set_current_line(132, ng0);
    t1 = (t0 + 1152U);
    t2 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 7784);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(133, ng0);
    t3 = (t0 + 14182);
    t6 = ((STD_STANDARD) + 384);
    t9 = (t0 + 2312U);
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
    t17 = floatfixlib_p_0618294350_sub_3419135235_3517329569(FLOATFIXLIB_P_0618294350, t8, t9, t15, 1000000);
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
    t33 = (t0 + 14189);
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
    t46 = (t0 + 2312U);
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
    t53 = floatfixlib_p_0618294350_sub_3419135235_3517329569(FLOATFIXLIB_P_0618294350, t45, t46, t51, 1000000);
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
    t67 = (t0 + 14197);
    t71 = ((STD_STANDARD) + 1008);
    t73 = (t72 + 0U);
    t74 = (t73 + 0U);
    *((int *)t74) = 1;
    t74 = (t73 + 4U);
    *((int *)t74) = 8;
    t74 = (t73 + 8U);
    *((int *)t74) = 1;
    t75 = (8 - 1);
    t55 = (t75 * 1);
    t55 = (t55 + 1);
    t74 = (t73 + 12U);
    *((unsigned int *)t74) = t55;
    t69 = xsi_base_array_concat(t69, t70, t71, (char)97, t64, t65, (char)97, t67, t72, (char)101);
    t74 = ((STD_STANDARD) + 384);
    t79 = (t0 + 2312U);
    t80 = *((char **)t79);
    t81 = (3 - 1);
    t55 = (t81 * 1);
    t82 = (32U * t55);
    t83 = (0 + t82);
    t79 = (t80 + t83);
    t85 = (t84 + 0U);
    t86 = (t85 + 0U);
    *((int *)t86) = 8;
    t86 = (t85 + 4U);
    *((int *)t86) = -23;
    t86 = (t85 + 8U);
    *((int *)t86) = -1;
    t87 = (-23 - 8);
    t88 = (t87 * -1);
    t88 = (t88 + 1);
    t86 = (t85 + 12U);
    *((unsigned int *)t86) = t88;
    t86 = floatfixlib_p_0618294350_sub_3419135235_3517329569(FLOATFIXLIB_P_0618294350, t78, t79, t84, 1000000);
    t89 = ((FLOATFIXLIB_P_0618294350) + 1408U);
    t90 = *((char **)t89);
    t91 = *((unsigned char *)t90);
    t89 = ((FLOATFIXLIB_P_0618294350) + 1648U);
    t92 = *((char **)t89);
    t93 = *((unsigned char *)t92);
    t89 = floatfixlib_p_0618294350_sub_3281882406_3517329569(FLOATFIXLIB_P_0618294350, t77, t86, t78, 32, t91, t93);
    t94 = ieee_p_1242562249_sub_2271993008_1035706684(IEEE_P_1242562249, t89, t77);
    t95 = xsi_int_to_mem(t94);
    t96 = xsi_string_variable_get_image(t76, t74, t95);
    t99 = ((STD_STANDARD) + 1008);
    t97 = xsi_base_array_concat(t97, t98, t99, (char)97, t69, t70, (char)97, t96, t76, (char)101);
    t100 = (t5 + 12U);
    t88 = *((unsigned int *)t100);
    t101 = (7U + t88);
    t102 = (t101 + 8U);
    t103 = (t43 + 12U);
    t104 = *((unsigned int *)t103);
    t105 = (t102 + t104);
    t106 = (t105 + 8U);
    t107 = (t76 + 12U);
    t108 = *((unsigned int *)t107);
    t109 = (t106 + t108);
    xsi_report(t97, t109, (unsigned char)0);
    goto LAB3;

}


extern void work_a_0143837599_2542024188_init()
{
	static char *pe[] = {(void *)work_a_0143837599_2542024188_p_0,(void *)work_a_0143837599_2542024188_p_1,(void *)work_a_0143837599_2542024188_p_2,(void *)work_a_0143837599_2542024188_p_3,(void *)work_a_0143837599_2542024188_p_4,(void *)work_a_0143837599_2542024188_p_5,(void *)work_a_0143837599_2542024188_p_6,(void *)work_a_0143837599_2542024188_p_7,(void *)work_a_0143837599_2542024188_p_8,(void *)work_a_0143837599_2542024188_p_9,(void *)work_a_0143837599_2542024188_p_10,(void *)work_a_0143837599_2542024188_p_11,(void *)work_a_0143837599_2542024188_p_12,(void *)work_a_0143837599_2542024188_p_13};
	xsi_register_didat("work_a_0143837599_2542024188", "isim/rotador3d_tb_isim_beh.exe.sim/work/a_0143837599_2542024188.didat");
	xsi_register_executes(pe);
}
