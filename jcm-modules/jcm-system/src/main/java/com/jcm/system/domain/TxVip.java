package com.jcm.system.domain;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.jcm.common.core.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * vip对象 tx_vip
 *
 * @author lvshihao
 * @date 2025-01-11
 */

@Data
@NoArgsConstructor
@AllArgsConstructor
@ExcelIgnoreUnannotated
@TableName("tx_vip")
public class TxVip extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 会员id
     */
    @TableId(type = IdType.AUTO)
    @ExcelProperty(value = "${comment}")
    private Long vipId;

    /**
     * 咸鱼名称
     */
    @ExcelProperty(value = "咸鱼名称")
    private String xyName;

    /**
     * 起始时间
     */
    @ExcelProperty(value = "起始时间")
    private LocalDateTime startingTime;

    /**
     * 结束时间
     */
    @ExcelProperty(value = "结束时间")
    private LocalDateTime stopingTime;

    /**
     * 开通天数
     */
    @ExcelProperty(value = "开通天数")
    private String purchaseDays;

    /**
     * 设备名称
     */
    @ExcelProperty(value = "设备名称")
    private String unitType;

    /**
     * 状态(0在用，1下线)
     */
    private Boolean status;

    /**
     * 登录方式（QQ或微信）
     */
    @ExcelProperty(value = "登录方式（QQ或微信）")
    private String loginMethod;

    /**
     * 登录账号
     */
    private String loginAccount;


}
