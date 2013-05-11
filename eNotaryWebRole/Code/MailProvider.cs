﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;

namespace eNotaryWebRole.Code
{
    public class MailProvider
    {
        public static bool SendEmailToUser(string subj, string body,string to, string from)
        {



          

            MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(to);
             mail.From = new MailAddress(from, "Notariat" , System.Text.Encoding.UTF8);
            mail.Subject = subj ;
            mail.SubjectEncoding = System.Text.Encoding.UTF8; 
            mail.Body = body; 
            mail.BodyEncoding = System.Text.Encoding.UTF8; 
            mail.IsBodyHtml = true ; 
            mail.Priority = MailPriority.High; 
 
            SmtpClient client = new SmtpClient(); 
            //Add the Creddentials- use your own email id and password

             client.Credentials = new System.Net.NetworkCredential(from, "Ana123!@#");
 
            client.Port = 587; // Gmail works on this port 
             client.Host = "smtp.gmail.com"; 
            client.EnableSsl = true; //Gmail works on Server Secured Layer
           try 
            { 
                client.Send(mail); 
            } 
            catch (Exception ex)  
            { 
                Exception ex2 = ex; 
                string errorMessage = string.Empty;  
                while (ex2 != null) 
                { 
                    errorMessage += ex2.ToString(); 
                    ex2 = ex2.InnerException; 
                } 

            } // end try 




            return true;
        }



    }
}