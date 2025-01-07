package com.jcm.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.jcm.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * vip对象 tx_vip
 *
 * @author lvshihao
 * @date 2025-01-07
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
public class TxVip extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 会员id */
    private Long vipId;

    /** 咸鱼名称 */
    @ExcelProperty(value = "咸鱼名称")
    private String xyName;

    /** 起始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty(value = "起始时间")
    private Date startingTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @ExcelProperty(value = "结束时间")
    private Date stopingTime;

    /** 开通天数 */
    @ExcelProperty(value = "开通天数")
    private String purchaseDays;

    /** 设备名称 */
    @ExcelProperty(value = "设备名称")
    private String unitType;

    /** 状态(0在用，1下线) */
    @ExcelProperty(value = "状态(0在用，1下线)")
    private String status;

    /** 登录方式（QQ或微信） */
    @ExcelProperty(value = "登录方式（QQ或微信）")
    private String loginMethod;

    /** 登录账号 */
    @ExcelProperty(value = "登录账号")
    private String loginAccount;


}
