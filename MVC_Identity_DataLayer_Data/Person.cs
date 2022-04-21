using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MVC_Identity_DataLayer_Data
{
    public class Person : DataObject
    {
        public class PersonDetails
        {
            public int PersonID;
            public string FirstName;
            public string LastName;
            public int Age;
            public string EmailID;
            public string Gender;
            public int AddressID;
            public string Message;
        }

        public Person() : base()
        {

        }

        public List<PersonDetails> GetAllPerson()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_get_all_persons", conn); //{ CommandType = CommandType.StoredProcedure };
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlParameter outoutParameter = new SqlParameter();
            outoutParameter.ParameterName = "@PersonCount";
            outoutParameter.SqlDbType = SqlDbType.Int;
            outoutParameter.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(outoutParameter);

            try
            {
                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                List<PersonDetails> persons = new List<PersonDetails>();

                while (rdr.Read())
                {
                    PersonDetails person = new PersonDetails();
                    person.PersonID = Convert.ToInt32(rdr["PersonID"]);
                    person.FirstName = Convert.ToString(rdr["FirstName"]);
                    person.LastName = Convert.ToString(rdr["LastName"]);
                    person.Age = Convert.ToInt32(rdr["Age"]);
                    person.EmailID = Convert.ToString(rdr["EmailID"]);
                    person.Gender = Convert.ToString(rdr["Gender"]);
                    person.AddressID = Convert.ToInt32(rdr["AddressID"]);

                    persons.Add(person);

                }
                return persons;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();
            }

        }

        //public persondetails getperson(int id)
        //{
        //    sqlconnection conn = new sqlconnection(connectionstring);
        //    sqlcommand cmd = new sqlcommand("sp_get_person", conn);
        //    cmd.commandtype = commandtype.storedprocedure;

        //    cmd.parameters.addwithvalue("@personid", id);

        //    conn.open();

        //    sqldatareader rdr = cmd.executereader();

        //    persondetails person = new persondetails();

        //    while (rdr.read())
        //    {
        //        person.personid = convert.toint32(rdr["personid"]);
        //        person.firstname = convert.tostring(rdr["firstname"]);
        //        person.lastname = convert.tostring(rdr["lastname"]);
        //        person.age = convert.toint32(rdr["age"]);
        //        person.emailid = convert.tostring(rdr["emailid"]);
        //        person.gender = convert.tostring(rdr["gender"]);

        //    }
        //    return person();

        //}

        public void InsertPerson(PersonDetails obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SP_insert_person", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@FirstName", obj.FirstName);
            cmd.Parameters.AddWithValue("@LasttName", obj.LastName);
            cmd.Parameters.AddWithValue("@Age", obj.Age);
            cmd.Parameters.AddWithValue("@EmailID", obj.EmailID);
            cmd.Parameters.AddWithValue("@Gender", obj.Gender);
            cmd.Parameters.AddWithValue("@AddressID", obj.AddressID);

            try
            {
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                conn.Close();

            }
        }
    }
}