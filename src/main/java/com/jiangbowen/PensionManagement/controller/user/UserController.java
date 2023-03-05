package com.jiangbowen.PensionManagement.controller.user;

import com.jiangbowen.PensionManagement.entity.Message;
import com.jiangbowen.PensionManagement.entity.Admin;
import com.jiangbowen.PensionManagement.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;


@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("login")
    @ResponseBody
    public Message<String> Login(String userid, String password, String userType, HttpSession session, HttpServletRequest request, Model model, String checkCode) throws IOException {
        String Code = (String) session.getAttribute("checkCode");
        Message<String> msg = new Message<>();
        if(Code==null)
        {
            msg.setStatus(222);
            msg.setMessage("验证码失效！");
            return msg;
        }
        if (!Code.equalsIgnoreCase(checkCode)) {
            msg.setStatus(221);
            msg.setMessage("验证码错误！");
            return msg;
        }
        session.removeAttribute("checkCode");
        switch (userType) {
            case "1":
                System.out.println("家属");
                break;
            case "2":
                System.out.println("职工");
                break;
            case "3":
                System.out.println("管理员");

                try {
                    Admin admin = userService.getAdminById(userid, password);
                    if(admin!=null)
                    {
                        request.getSession().setAttribute("userid",admin.getUserid());
                        request.getSession().setAttribute("username",admin.getUsername());
                        msg.setStatus(200);
                        msg.setMessage(admin.getUsername());
                    }
                    else
                    {
                        msg.setStatus(222);
                        msg.setMessage("账号或密码错误！");
                    }
                }catch (Exception e)
                {
                    msg.setStatus(500);
                    msg.setMessage("数据库发生错误！");
                    System.out.println(e);
                }
                break;
        }
        session.setAttribute("userType",userType);
        return msg;
    }
    @RequestMapping("getusername")
    @ResponseBody
    public Message<String> getUserName(HttpSession session)
    {
        Message<String> message = new Message<>();
        String username = (String) session.getAttribute("username");
        if(username!=null) {
            message.setMessage(username);
            message.setStatus(200);
        }
        return message;
    }
    @RequestMapping("getuserid")
    @ResponseBody
    public Message<String> getUserId(HttpSession session)
    {
        Message<String> message = new Message<>();
        String userid = (String) session.getAttribute("userid");
        if(userid!=null) {
            message.setMessage(userid);
            message.setStatus(200);
        }
        return message;
    }
/*    @RequestMapping("update")
    @ResponseBody
    public Message<String> update(HttpSession session,HttpServletResponse response,HttpServletRequest request,String newpass,String mpass)throws IOException
    {
        String userType = (String)session.getAttribute("userType");
        System.out.println(newpass);
        System.out.println(mpass);
        Message<String> message = new Message<>();
        String id = (String)session.getAttribute("id");
        String Code = (String)session.getAttribute("");
        switch (userType) {
            case "1":
                System.out.println("学生");
                try {
                    Student studentBySid = studentService.getStudentBySid(id);
                    if(studentBySid!=null&&studentBySid.getPassword().equals(mpass))
                    {
                        userService.UpdateStudent((String) session.getAttribute("id"),newpass);
                        message.setStatus(200);
                    }else {
                        message.setStatus(201);
                    }

                }catch (Exception e)
                {
                    message.setStatus(400);
                }
                break;
            case "2":
                System.out.println("教师");
                try {
                    Teacher teacher = teacherService.getTeacherByTid(id);
                    if(teacher!=null&&teacher.getPassword().equals(mpass))
                    {
                        userService.UpdateTeacher((String) session.getAttribute("id"),newpass);
                        message.setStatus(200);
                    }else {
                        message.setStatus(201);
                    }

                }catch (Exception e)
                {
                    message.setStatus(400);
                }
                break;
            case "3":
                System.out.println("管理员");

                try {
                    Admin admin = userService.getAdminById(id,mpass);
                    if(admin !=null)
                    {
                        System.out.println(1111);
                        userService.Update((String) session.getAttribute("id"),newpass);
                        message.setStatus(200);
                    }else {
                        message.setStatus(201);
                    }

                }catch (Exception e)
                {
                    message.setStatus(400);
                }
                break;
        }


        return message;
    }*/
    @RequestMapping("checkCode")//验证码
    public void checkCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //服务器通知浏览器不要缓存
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");

        //在内存中创建一个长80，宽30的图片，默认黑色背景
        //参数一：长
        //参数二：宽
        //参数三：颜色
        int width = 80;
        int height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        //获取画笔
        Graphics g = image.getGraphics();
        //设置画笔颜色为灰色
        g.setColor(Color.GRAY);
        //填充图片
        g.fillRect(0, 0, width, height);

        //产生4个随机验证码，12Ey
        String checkCode = getCheckCode();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("checkCode", checkCode);

        //设置画笔颜色为黄色
        g.setColor(Color.YELLOW);
        //设置字体的小大
        g.setFont(new Font("黑体", Font.BOLD, 24));
        //向图片上写入验证码
        g.drawString(checkCode, 15, 25);

        //将内存中的图片输出到浏览器
        //参数一：图片对象
        //参数二：图片的格式，如PNG,JPG,GIF
        //参数三：图片输出到哪里去
        ImageIO.write(image, "PNG", response.getOutputStream());
    }
    /**
     * 产生4位随机字符串
     */
    private String getCheckCode() {
        String base = "0123456789ABCDEFGabcdefg";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for(int i=1;i<=4;i++){
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }
    @RequestMapping("exit")
    public void exit(HttpSession session,HttpServletResponse response,HttpServletRequest request)throws IOException
    {
        session.removeAttribute("userid");
        String path = request.getContextPath();
        response.sendRedirect(path+"/login.jsp");
        System.out.println(path);
    }
}
