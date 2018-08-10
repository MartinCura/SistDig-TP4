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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *FLOATFIXLIB_P_2011092313;
char *STD_TEXTIO;
char *IEEE_P_2592010699;
char *IEEE_P_1242562249;
char *FLOATFIXLIB_P_0892474878;
char *IEEE_P_3972351953;
char *FLOATFIXLIB_P_0618294350;
char *WORK_P_0200094193;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    std_textio_init();
    floatfixlib_p_2011092313_init();
    ieee_p_3972351953_init();
    floatfixlib_p_0892474878_init();
    floatfixlib_p_0618294350_init();
    work_p_0200094193_init();
    work_a_1377579441_3378920104_init();
    work_a_3709286660_2333319832_init();


    xsi_register_tops("work_a_3709286660_2333319832");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    FLOATFIXLIB_P_2011092313 = xsi_get_engine_memory("floatfixlib_p_2011092313");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    FLOATFIXLIB_P_0892474878 = xsi_get_engine_memory("floatfixlib_p_0892474878");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    FLOATFIXLIB_P_0618294350 = xsi_get_engine_memory("floatfixlib_p_0618294350");
    WORK_P_0200094193 = xsi_get_engine_memory("work_p_0200094193");

    return xsi_run_simulation(argc, argv);

}
