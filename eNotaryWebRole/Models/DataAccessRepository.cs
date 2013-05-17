﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using eNotaryWebRole.Models;

namespace eNotaryWebRole.Models
{
    public class DataAccessRepository:IDataAccessRepository
    {
        string username = "user_test"; 
        private static eNotaryDBEFEntities _db = new eNotaryDBEFEntities();

        public  string getRole(string username)
        {
            string roleName = "";
            try
            {
                var role = (from r in _db.Users.Where(o => o.Username == username)
                            join ur in _db.UserRoles
                            on r.RoleID equals ur.ID
                            select ur.RoleName).FirstOrDefault();
                roleName = role;
            }
            catch (Exception ex)
            {
                roleName = "admin";
            }
           
                return roleName;
            
        }

        public Act create_Act(long act_type_id, string act_name, string act_reason, string act_reason_state, string state, string act_extra_details)
        {
            long user_ID = _db.Users.Where(x => x.Username == username).FirstOrDefault().ID;
            Act new_act = new Act(){
            ActTypeID =act_type_id,
            Name = act_name,
            CreationDate = DateTime.Now,
            Reason =act_reason,
            ExtraDetails = act_extra_details,
            ReasonState = act_reason_state,
            State = state,
            CreateContactID = user_ID
           

            };

            return new_act;
        }

       public void update_Act(long id,long act_type_id, string act_name, string act_reason, string act_reason_state, string state, string act_extra_details)
        {
            long user_ID = _db.Users.Where(x => x.Username == username).FirstOrDefault().ID;
            
                Act up_Act = _db.Acts.Where(x => x.ID == id).FirstOrDefault();
                up_Act.ActTypeID = act_type_id;
                up_Act.Name = act_name;
                up_Act.EditDate =DateTime.Now;
                up_Act.EditContactID = user_ID;

                up_Act.Reason = act_reason;
                up_Act.ReasonState = act_reason_state;
                up_Act.State = state;
                up_Act.ExtraDetails = act_extra_details;



                _db.SaveChanges();
            

            
        }

       public void update_SignedAct(long id,long act_type_id, string act_name, string act_reason_signed,bool act_sent_to_client, bool act_signed, string act_extra_details, string act_reason)
       {
           long user_ID = _db.Users.Where(x => x.Username == username).FirstOrDefault().ID;
           SignedAct up_Act = _db.SignedActs.Where(x => x.ID == id).FirstOrDefault();

           Act related_act = _db.Acts.Where(x => x.ID == up_Act.ActID).FirstOrDefault();
          

           up_Act.Name = act_name;
           up_Act.ReasonSigned = act_reason_signed;
           
           up_Act.SentToClient = act_sent_to_client;
           up_Act.Signed = act_signed;
           up_Act.ExtraDetails = act_extra_details  ;
           up_Act.EditDate = DateTime.Now;
           up_Act.EditContactID = user_ID;

           related_act.ActTypeID = act_type_id;
           related_act.Signed = true;
           related_act.State = "vizualizat";
           related_act.ReasonState = act_reason;
           related_act.EditContactID = user_ID;
           related_act.EditDate = DateTime.Now;





           _db.SaveChanges();



       }



    }
}