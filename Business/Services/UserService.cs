﻿using System;
using System.Collections.Generic;
using System.Linq;
using TimeshEAT.Business.Models;
using TimeshEAT.Domain.Interfaces.Repositories;
using TimeshEAT.Business.Interfaces;

namespace TimeshEAT.Business.Services
{
	public class UserService : BaseService, IUserService
	{
		public UserService(IRepositoryContext context) : base(context) { }

		public IEnumerable<UserModel> Get()
		{
			var result = _context.UserRepository.GetAll()
				.Select(x => (UserModel)x);

			//TODO: add roles and companies models

			return result;
		}

		public UserModel GetBy(int id)
		{
			if (id <= 0) throw new ArgumentNullException(nameof(id), "Id cannot be null!");

			var result = _context.UserRepository.GetById(id);

			//TODO: add roles and companies models

			return result;
		}

		public UserModel Add(UserModel user)
		{
			if (user == null) throw new ArgumentNullException(nameof(user), "User cannot be null!");

			var result = _context.UserRepository.Insert(user);

			//TODO: add roles and companies models

			return result;
		}

		public UserModel Save(UserModel user)
		{
			if (user == null) throw new ArgumentNullException(nameof(user), "User cannot be null!");

			var result = _context.UserRepository.Update(user);

			//TODO: add roles and companies models

			return result;
		}

		public void Remove(UserModel user)
		{
			if (user == null) throw new ArgumentNullException(nameof(user), "User cannot be null!");

			_context.UserRepository.Delete(user);
		}

        public LoginResultModel Login(string email, string passwordHash)
        {
            LoginResultModel model = new LoginResultModel();
            var user = _context.UserRepository.GetAll().FirstOrDefault(u => u.Email.Equals(email));
            if (user == null || !user.Password.Equals(passwordHash, StringComparison.OrdinalIgnoreCase))
            {
                model.IsAuthenticated = false;
				model.IsActive = true;
                return model;
            }

            if (!user.IsActive)
            {
                model.IsAuthenticated = false;
                model.IsActive = false;
                return model;
            }

            model.IsAuthenticated = true;
            model.IsActive = true;
            model.User = user;
            return model;
        }

		public void Lockout(string email)
		{
			var user = _context.UserRepository.GetAll().FirstOrDefault(u => u.Email.Equals(email));

			if(user != null)
			{
				user.IsActive = false;
				_context.UserRepository.Update(user);
			}
		}
	}
}
