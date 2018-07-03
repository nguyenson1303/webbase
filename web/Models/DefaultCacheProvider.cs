namespace Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Runtime.Caching;
    using System.Web;

    /// <summary>
    /// Default Cache Provider
    /// </summary>
    /// <seealso cref="Web.Models.ICacheProvider" />
    public class DefaultCacheProvider : ICacheProvider
    {
        /// <summary>
        /// Gets the cache.
        /// </summary>
        /// <value>
        /// The cache.
        /// </value>
        private ObjectCache Cache
        {
            get
            {
                return MemoryCache.Default;
            }
        }

        /// <summary>
        /// Gets the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <returns>Get Cache</returns>
        public object Get(string key)
        {
            return this.Cache[key];
        }

        /// <summary>
        /// Invalidates the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        public void Invalidate(string key)
        {
            this.Cache.Remove(key);
        }

        /// <summary>
        /// Determines whether the specified key is set.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <returns>
        ///   <c>true</c> if the specified key is set; otherwise, <c>false</c>.
        /// </returns>
        public bool IsSet(string key)
        {
            return this.Cache[key] != null;
        }

        /// <summary>
        /// Sets the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="data">The data.</param>
        /// <param name="cacheTime">The cache time.</param>
        public void Set(string key, object data, int cacheTime)
        {
            CacheItemPolicy policy = new CacheItemPolicy();
            policy.AbsoluteExpiration = DateTime.Now + TimeSpan.FromMinutes(cacheTime);

            this.Cache.Add(new CacheItem(key, data), policy);
        }
    }
}