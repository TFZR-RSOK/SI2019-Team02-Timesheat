﻿using System;

namespace TimeshEAT.Web.Models.Pagination
{
	public class PaginationRenderModel
	{
		public PaginationRenderModel(int currentPage, int totalPages, int numberOfVisiblePages = 0)
		{
			CurrentPage = currentPage;
			TotalPages = totalPages;
			NumberOfVisiblePages = numberOfVisiblePages;
		}

		public int CurrentPage { get; }
		public int TotalPages { get; }
		public int NumberOfVisiblePages { get; }

		private int _numberOfSections;
		private int _currentSection;
		private int _startIndex;
		private int _endIndex;

		public int GetNumberOfSections()
		{
			if (_numberOfSections == default(int) && NumberOfVisiblePages > 0 && TotalPages > 0)
			{
				_numberOfSections = (int)Math.Ceiling((double)TotalPages / NumberOfVisiblePages);
			}

			return _numberOfSections;
		}

		public int GetCurrentSection()
		{
			if (_currentSection == default(int) && CurrentPage > 0 && NumberOfVisiblePages > 0)
			{
				_currentSection = (int)Math.Ceiling((double)CurrentPage / NumberOfVisiblePages);
			}

			return _currentSection;
		}

		public int GetStartIndex()
		{
			if (_startIndex == default(int))
			{
				int currentSection = GetCurrentSection();
				if (currentSection > 0)
				{
					_startIndex = 1 + (currentSection - 1) * NumberOfVisiblePages;
				}
			}

			return _startIndex;
		}

		public int GetEndIndex()
		{
			if (_endIndex == 0)
			{
				int currentSection = GetCurrentSection();
				if (currentSection > 0)
				{
					_endIndex = currentSection * NumberOfVisiblePages;
					return _endIndex = _endIndex  > TotalPages ? TotalPages : _endIndex;
				}
			}

			return _endIndex;
		}
	}
}