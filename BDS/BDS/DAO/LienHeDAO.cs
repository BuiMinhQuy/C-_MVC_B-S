using AFModels;
using BDS.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace BDS.DAO
{
    public class LienHeDAO
    {
        BatDongSanContext db = new BatDongSanContext();
        public List<LienHeViewModel> list()
        {
            List<LienHeViewModel> kq = (from lh in db.LienHes
                                        select new LienHeViewModel
                                        {
                                            MaLienHe = lh.MaLienHe,
                                            HoTen = lh.HoTen,
                                            Email = lh.Email,
                                            TieuDe = lh.TieuDe,
                                            LoiNhan = lh.LoiNhan


                                        }).ToList();
            return kq;
        }


        public IEnumerable<LienHe> ListAll(int pageNumber, int pageSize)
        {
            return db.LienHes.OrderByDescending(s => s.MaLienHe).ToPagedList(pageNumber, pageSize);
        }
        public long Insert(LienHe lh)
        {
            db.LienHes.Add(lh);
            db.SaveChanges();
            return lh.MaLienHe;
        }

        public LienHe GetByID(int id)
        {
            return db.LienHes.Find(id);
        }
        public IEnumerable<LienHe> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<LienHe> model = db.LienHes;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TieuDe.Contains(searchString) || x.TieuDe.Contains(searchString));
            }

            return model.OrderByDescending(x => x.MaLienHe).ToPagedList(page, pageSize);
        }


        private static string email = ConfigurationManager.AppSettings["FromEmailAddress"];
        private static string password = ConfigurationManager.AppSettings["FromEmailPassword"];

        public bool SendEmail(string address, string subject, string message)
        {
            bool rs = false;
            //string password = "0332813815Aa";
            try
            {
                MailMessage msg = new MailMessage();
                var smtp = new SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com"; //host name
                    smtp.Port = 587; //port number
                    smtp.EnableSsl = true; //whether your smtp server requires SSL
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;

                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = new NetworkCredential()
                    {
                        UserName = email,
                        Password = password
                    };
                }
                MailAddress fromAddress = new MailAddress(email, address);
                msg.From = fromAddress;
                msg.To.Add(new MailAddress(address));
                msg.Subject = subject;
                msg.Body = message;
                smtp.Send(msg);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                rs = false;
            }
            return rs;
        }

        public void SendEmail1(string address, string subject, string message)
        {
            string email = "buiminhquy2105@gmail.com";
            string password = "0332813815Aa";

            var loginInfo = new NetworkCredential(email, password);
            var msg = new MailMessage();
            var smtpClient = new SmtpClient("smtp.gmail.com", 587);

            msg.From = new MailAddress(email);
            msg.To.Add(new MailAddress(address));
            msg.Subject = subject;
            msg.Body = message;
            msg.IsBodyHtml = true;

            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = loginInfo;
        }
    }
}