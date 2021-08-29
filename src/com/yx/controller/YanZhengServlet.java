package com.yx.controller;


import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/yanzheng")
public class YanZhengServlet extends HttpServlet{
	
    private static final String CONTENT_TYPE = "text/html; charset=gb2312";  
    //閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷锋瘝閿熶茎杈炬嫹灏�,閿熸枻鎷峰皬  
    private Font mFont = new Font("Times New Roman", Font.PLAIN, 17);  
    public void init() throws ServletException  
    {  
        super.init();  
    }  
    Color getRandColor(int fc,int bc)  
    {  
        Random random = new Random();  
        if(fc>255) fc=255;  
        if(bc>255) bc=255;  
        int r=fc+random.nextInt(bc-fc);  
        int g=fc+random.nextInt(bc-fc);  
        int b=fc+random.nextInt(bc-fc);  
        return new Color(r,g,b);  
    }  
  
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
    {  
        response.setHeader("Pragma","No-cache");  
        response.setHeader("Cache-Control","no-cache");  
        response.setDateHeader("Expires", 0);  
        //閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷峰偦閿熸枻鎷烽敓鎺ワ讣鎷烽敓閰佃锟� 
        response.setContentType("image/jpeg");  
          
        int width=80, height=18;  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
          
        Graphics g = image.getGraphics();  
        Random random = new Random();  
        g.setColor(getRandColor(200,250));  
        g.fillRect(1, 1, width-1, height-1);  
        g.setColor(new Color(102,102,102));  
        g.drawRect(0, 0, width-1, height-1);  
        g.setFont(mFont);  
  
        g.setColor(getRandColor(160,200));  
  
        //閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓锟� 
        for (int i=0;i<155;i++)  
        {  
            int x = random.nextInt(width - 1);  
            int y = random.nextInt(height - 1);  
            int xl = random.nextInt(6) + 1;  
            int yl = random.nextInt(12) + 1;  
            g.drawLine(x,y,x + xl,y + yl);  
        }  
  
        //閿熸枻鎷烽敓鏂ゆ嫹涓�閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹閿燂拷 
        for (int i = 0;i < 70;i++)  
        {  
            int x = random.nextInt(width - 1);  
            int y = random.nextInt(height - 1);  
            int xl = random.nextInt(12) + 1;  
            int yl = random.nextInt(6) + 1;  
            g.drawLine(x,y,x - xl,y - yl);  
        }  
  
        //閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹,閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓闃额亷鎷烽敓杞款亷鎷烽敓渚ワ拷 
        String sRand="";  
        for (int i=0;i<4;i++)  
        {  
            int itmp = random.nextInt(26) + 65;  
            char ctmp = (char)itmp;  
            sRand += String.valueOf(ctmp);  
            g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));  
            g.drawString(String.valueOf(ctmp),15*i+10,16);  
        }  
  
        HttpSession session = request.getSession(true);  
        session.setAttribute("rand",sRand);  
        g.dispose();  
//        ImageIO.write(image, "JPEG", response.getOutputStream());
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(response.getOutputStream());
        encoder.encode(image);
    }  
    public void destroy()  
    {  
    } 

}
