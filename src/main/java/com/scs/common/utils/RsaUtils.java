package com.scs.common.utils;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * rsa 加密解密方法
 *
 * @author Administrator
 */
@Slf4j
@Component
public class RsaUtils {

    @Value("${rsa.public}")
    private String rsaPublic;

    @Value("${rsa.private}")
    private String rsaPrivate;


    /**
     * 加密方法
     *
     * @param str
     * @return
     */
    public String rsaEncrypt(String str) {
        //base64编码的公钥
        byte[] decoded = Base64.decodeBase64(rsaPublic);
        RSAPublicKey pubKey = null;
        String outStr = null;
        try {
            pubKey = (RSAPublicKey) KeyFactory.getInstance("RSA").generatePublic(new X509EncodedKeySpec(decoded));
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.ENCRYPT_MODE, pubKey);
            outStr = Base64.encodeBase64String(cipher.doFinal(str.getBytes(StandardCharsets.UTF_8)));
        } catch (InvalidKeySpecException | BadPaddingException | IllegalBlockSizeException | InvalidKeyException | NoSuchPaddingException | NoSuchAlgorithmException e) {
            log.info(e.getMessage());
        }
        //RSA加密
        return outStr;
    }


    /**
     * 解密方法
     *
     * @param str
     * @return
     */
    public String rsaDecrypt(String str) {
        //64位解码加密后的字符串
        byte[] inputByte = Base64.decodeBase64(str.getBytes(StandardCharsets.UTF_8));
        //base64编码的私钥
        byte[] decoded = Base64.decodeBase64(rsaPrivate);
        RSAPrivateKey priKey = null;
        //RSA解密
        Cipher cipher = null;
        String outStr = null;
        try {
            priKey = (RSAPrivateKey) KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(decoded));
            cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.DECRYPT_MODE, priKey);
            outStr = new String(cipher.doFinal(inputByte));
        } catch (InvalidKeySpecException | NoSuchAlgorithmException | NoSuchPaddingException | BadPaddingException | IllegalBlockSizeException | InvalidKeyException e) {
            log.info(e.getMessage());
        }
        return outStr;
    }

}
