package com.scs.common.constant;


/**
 *  队列-交换机和队列常量
 * @author Administrator
 */
public class RabbitMqConstants {

    /**
     * 邮件发送的交换机标识
     */
    public final static String RABBIT_EXCHANGE_SELF_CHECKING_SEND_EMAIL_STREAM = "ExchangeToSendEmail";


    /**
     * 邮件发送的队列标识
     */
    public final static String RABBIT_QUEUES_SELF_CHECKING_SEND_EMAIL = "queuesToSendEmail";







    /**
     * 上传系统发送的交换机标识
     */
    public final static String RABBIT_EXCHANGE_SELF_CHECKING_LOGS_STREAM = "ExchangeLogsToUpload";


    /**
     * 上传保存试卷队列标识
     */
    public final static String RABBIT_QUEUES_SELF_CHECKING_LOGS_SAVE = "queuesLogsToUploadSave";



    /**
     * 上传系统发送的交换机标识
     */
    public final static String RABBIT_EXCHANGE_SELF_CHECKING_LOGS_DEAD_STREAM = "ExchangeLogsToUploadDead";

    /**
     * 上传保存试卷死信队列标识
     */
    public final static String RABBIT_QUEUES_SELF_CHECKING_LOGS_SAVE_DEAD = "queuesLogsToUploadSaveDead";
}
