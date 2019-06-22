﻿using System.Collections.Generic;
using System.Net;
using System.Text;
using RestSharp;
using RestSharp.Extensions;
using TimeshEAT.Business.Interfaces;
using TimeshEAT.Business.Models;
using TimeshEAT.Domain.Models;

namespace TimeshEAT.Business.API
{
    public partial class ApiClient : IApiClient
    {
        private readonly RestClient _client;
        private string _token;
        public const string DateTimeFormat = "yyyy-MM-ddTHH:mm:sszzz";
        
        public ApiClient(string token = "")
        {
            _client = ClientFactory.CreateClient();
            _token = token;
        }

        public AuthorizationResponseModel Authorize(AuthorizationModel model)
        {
            RestRequest request = new RestRequest("/api/authorization/");
            request.AddParameter("Email", model.Email);
            request.AddParameter("PasswordHash", model.PasswordHash);
            request.Method = Method.POST;

            var response = _client.Execute<AuthorizationResponseModel>(request);

            if (response.ResponseStatus == ResponseStatus.Error)
            {
                //log the error
            }

            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                //log the error 
            }

            if (response.StatusCode == HttpStatusCode.Forbidden)
            {
                //log the error
            }

            if (response.StatusCode == HttpStatusCode.OK && !string.IsNullOrWhiteSpace(response.Data?.Token))
            {
                _token = response.Data.Token;
            }

            return response.Data;
        }

        public T Execute<T>(RestRequest request) where T : Entity, new()
        {
            request.OnBeforeDeserialization = resp =>
            {
                int responseStatus = (int) resp.ResponseStatus;
                if (responseStatus == 401)
                {
                    //unauthorized
                }

                if (responseStatus >= 500)
                {
                    //server error
                }

                if (responseStatus >= 400)
                {
                    //client error
                    var restException = "{{ \"RestException\" : {0} }}";
                    var content = resp.RawBytes.AsString(); //get the response content
                    var newJson = string.Format(restException, content);

                    resp.Content = null;
                    resp.RawBytes = Encoding.UTF8.GetBytes(newJson.ToString());
                }
            };

            request.RequestFormat = DataFormat.Json;
            request.DateFormat = DateTimeFormat;
            if (!string.IsNullOrWhiteSpace(_token))
            {
                request.AddHeader("Authorization", $"Bearer {_token}");
            }

            var response = _client.Execute<T>(request);

            if (response.ResponseStatus == ResponseStatus.Error)
            {
                //log the error
            }

            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                //log the error 
            }

            return response.Data;
        }

        public T ExecuteList<T>(RestRequest request) where T : IEnumerable<Entity>, new()
        {
            request.OnBeforeDeserialization = resp =>
            {
                int responseStatus = (int)resp.ResponseStatus;
                if (responseStatus == 401)
                {
                    //unauthorized
                }

                if (responseStatus >= 500)
                {
                    //server error
                }

                if (responseStatus >= 400)
                {
                    //client error
                    var restException = "{{ \"RestException\" : {0} }}";
                    var content = resp.RawBytes.AsString(); //get the response content
                    var newJson = string.Format(restException, content);

                    resp.Content = null;
                    resp.RawBytes = Encoding.UTF8.GetBytes(newJson.ToString());
                }
            };

            request.RequestFormat = DataFormat.Json;
            request.DateFormat = DateTimeFormat;
            if (!string.IsNullOrWhiteSpace(_token))
            {
                request.AddHeader("Authorization", $"Bearer {_token}");
            }

            var response = _client.Execute<T>(request);

            if (response.ResponseStatus == ResponseStatus.Error)
            {
                //log the error
            }

            if (response.StatusCode == HttpStatusCode.Unauthorized)
            {
                //log the error 
            }

            return response.Data;
        }
    }
}
