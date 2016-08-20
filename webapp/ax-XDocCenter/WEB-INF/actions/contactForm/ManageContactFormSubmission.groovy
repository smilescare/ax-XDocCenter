import org.apache.http.HttpEntity
import org.apache.http.NameValuePair
import org.apache.http.client.entity.UrlEncodedFormEntity
import org.apache.http.client.methods.CloseableHttpResponse
import org.apache.http.client.methods.HttpPost
import org.apache.http.impl.client.CloseableHttpClient
import org.apache.http.impl.client.HttpClients
import org.apache.http.message.BasicNameValuePair
import org.apache.http.util.EntityUtils

import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.reflect.TypeToken

import java.lang.reflect.Type

/*
 *
 *  * *****************************************************************************************
 *  *  Copyright (c) SimbaQuartz  2016. - All Rights Reserved                                 *
 *  *  Unauthorized copying of this file, via any medium is strictly prohibited               *
 *  *  Proprietary and confidential                                                           *
 *  *  Written by Mandeep Sidhu <mandeep.sidhu@simbacart.com>,  August, 2016                    *
 *  * ****************************************************************************************
 *
   * Sends an email notification after verifying captcha value.
   * Read more on the documentation site here
   * https://developers.google.com/recaptcha/docs/verify
   *
 */

print("############## got fullname : " + parameters.fullName);
String gRrecaptchaResponse = (String)request.getParameter("g-recaptcha-response")

//try {

    CloseableHttpClient httpclient = HttpClients.createDefault();
    HttpPost httpPost = new HttpPost("https://www.google.com/recaptcha/api/siteverify");
    List <NameValuePair> nvps = new ArrayList <NameValuePair>();
    nvps.add(new BasicNameValuePair("secret", "6Ld7mScTAAAAABZL4IhPhWhSLbg9iD1nMA7JDbPZ"));
    nvps.add(new BasicNameValuePair("response", gRrecaptchaResponse));
    httpPost.setEntity(new UrlEncodedFormEntity(nvps));
    CloseableHttpResponse response2 = httpclient.execute(httpPost);

    try {
        System.out.println(response2.getStatusLine());
        HttpEntity entity2 = response2.getEntity();

        String responseText = EntityUtils.toString(entity2);
        Type type = new TypeToken<Map<String, Object>>(){}.getType();
        Gson gson = new GsonBuilder().create();
        Map<String, Object> responseJsonMap = gson.fromJson(responseText, type);

        boolean isValidCaptcha = (boolean)responseJsonMap.success;
        if(!isValidCaptcha){
            request.setAttribute("_ERROR_MESSAGE_", "Invalid captcha response, please verify you are human.")
            return "error";
        }
        // ensure response fully consumed
        EntityUtils.consume(entity2);
    } finally {
        response2.close();
    }

    //send email to configured set

return "success";