﻿using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using TimeshEAT.Business.Models;
using TimeshEAT.Web.Interfaces;

namespace TimeshEAT.Web.Models.Render
{
	public class MealDetailsRenderModel : IForm
	{
		public int Id { get; set; }
		public long Version { get; set; }

		[Required(ErrorMessage = "Naziv obroka je obavezno polje.")]
		[Display(Name = "Naziv obroka:")]
		public string Name { get; set; }
		[Required(ErrorMessage = "Cena obroka je obavezno polje.")]
		[Display(Name = "Cena obroka:")]
		public int Price { get; set; }
		[Required(ErrorMessage = "Kategorija je obavezno polje.")]
		[Display(Name = "Kategorija:")]
		public int CategoryId { get; set; }

		public IList<SelectListItem> CategoryList { get; set; }
        public string MealPortionsIds { get; set; }
        [Display(Name = "Porcije jela:")]
        public IList<SelectListItem> MealPortions { get; set; }
        public IList<PortionModel> Portions { get; set; }
        [Display(Name = "Porcije:")]
        public IList<SelectListItem> PortionsList { get; set; }

        public static implicit operator MealModel(MealDetailsRenderModel meal)
		{
			if (meal == null)
				return null;

            var mealModel = new MealModel(meal.Name, meal.Price, meal.CategoryId, meal.Id, meal.Version);
            mealModel.Portions = meal.Portions;

            return mealModel;
		}
	}
}