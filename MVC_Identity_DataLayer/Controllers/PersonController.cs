using MVC_Identity_DataLayer.Models;
using MVC_Identity_DataLayer_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static MVC_Identity_DataLayer_Data.Person;
//using static MVC_Identity_DataLayer_Data.Person;

namespace MVC_Identity_DataLayer.Controllers
{
    public class PersonController : Controller
    {
        // GET: Person
        public ActionResult Index()
        {
            Person dal = new Person();

            var persons = dal.GetAllPerson();

            List<PersonModel> personList = new List<PersonModel>();

            foreach(var person in persons)
            {
                PersonModel person1 = new PersonModel();

                person1.PersonID = person.PersonID;
                person1.FirstName = person.FirstName;
                person1.LastName = person.LastName;
                person1.Age = person.Age;
                person1.EmailID = person.EmailID;
                person1.AddressID = person.AddressID;
                person1.Gender = person.Gender;

                personList.Add(person1);
            }


            return View(personList);
        }

        //GET: Person/Create
        public ActionResult Create()
        {
            return View();
        }

        //Post: Person/Create

        [HttpPost]

        public ActionResult Create(FormCollection collection)
        {
            try
            {
                if(ModelState.IsValid)
                {
                    PersonDetails person = new PersonDetails();
                    person.FirstName = collection["FirstName"];
                    person.LastName = collection["LastName"];
                    person.Age = Convert.ToInt32(collection["Age"]);
                    person.Gender = collection["Gender"];
                    person.EmailID = collection["EmailID"];
                    person.AddressID = Convert.ToInt32(collection["AddressID"]);

                    Person dal = new Person();

                    dal.InsertPerson(person);

                    RedirectToAction("Index");
                   
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }

        }

    }
}