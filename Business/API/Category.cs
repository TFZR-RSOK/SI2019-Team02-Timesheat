﻿using System.Collections.Generic;
using RestSharp;
using TimeshEAT.Business.API.Models;
using TimeshEAT.Business.Models;

namespace TimeshEAT.Business.API
{
    public partial class ApiClient
    {
        public ApiResponseModel<List<T>> GetAllCategories<T>() where T : new()
        {
            RestRequest request = new RestRequest("/api/category");

            return ExecuteList<List<T>>(request);
        }

        public ApiResponseModel<T> GetCategoryById<T>(int id) where T : new()
        {
            RestRequest request = new RestRequest("/api/category");
            request.AddParameter("id", id);

            return Execute<T>(request);
        }

        public ApiResponseModel<T> AddCategory<T>(CategoryModel model) where T : new()
        {
            RestRequest request = new RestRequest("/api/category");
            request.Method = Method.POST;
            request.AddParameter("category", model);

            return Execute<T>(request);
        }

        public ApiResponseModel<T> UpdateCategory<T>(CategoryModel model) where T : new()
        {
            RestRequest request = new RestRequest("/api/category");
            request.Method = Method.PUT;
            request.AddParameter("category", model);

            return Execute<T>(request);
        }

        public void DeleteCategory(CategoryModel model)
        {
            RestRequest request = new RestRequest("/api/category");
            request.Method = Method.DELETE;
            request.AddParameter("category", model);

            Execute<CategoryModel>(request);
        }
    }
}