namespace DBBase.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Linq.Expressions;

    /// <summary>
    /// my extensions
    /// </summary>
    public static class MyExtensions
    {
        /// <summary>
        /// Customs the sort.
        /// </summary>
        /// <typeparam name="T">object type</typeparam>
        /// <typeparam name="TPropertyType">The type of the property type.</typeparam>
        /// <param name="collection">The collection.</param>
        /// <param name="propertyName">Name of the property.</param>
        /// <param name="sortOrder">The sort order.</param>
        /// <returns>Custom Sort</returns>
        public static IQueryable<T> CustomSort<T, TPropertyType>(this IQueryable<T> collection, string propertyName, string sortOrder)
        {
            IQueryable<T> sortedlist = null;

            ParameterExpression pe = Expression.Parameter(typeof(T), "p");
            Expression<Func<T, TPropertyType>> expr = Expression.Lambda<Func<T, TPropertyType>>(Expression.Property(pe, propertyName), pe);

            if (!string.IsNullOrEmpty(sortOrder) && sortOrder == "desc")
            {
                sortedlist = collection.OrderByDescending<T, TPropertyType>(expr.Compile()).AsQueryable();
            }
            else
            {
                sortedlist = collection.OrderBy<T, TPropertyType>(expr.Compile()).AsQueryable();
            }

            return sortedlist;
        }

        /// <summary>
        /// Distincts the by.
        /// </summary>
        /// <typeparam name="TSource">The type of the source.</typeparam>
        /// <typeparam name="TKey">The type of the key.</typeparam>
        /// <param name="source">The source.</param>
        /// <param name="keySelector">The key selector.</param>
        /// <returns>Distinct By</returns>
        public static IEnumerable<TSource> DistinctBy<TSource, TKey>(this IEnumerable<TSource> source, Func<TSource, TKey> keySelector)
        {
            HashSet<TKey> seenKeys = new HashSet<TKey>();
            foreach (TSource element in source)
            {
                if (seenKeys.Add(keySelector(element)))
                {
                    yield return element;
                }
            }
        }
    }
}