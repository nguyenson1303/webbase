namespace Web.Models
{
    /// <summary>
    /// I Cache Provider
    /// </summary>
    public interface ICacheProvider
    {
        /// <summary>
        /// Gets the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <returns>key of object</returns>
        object Get(string key);

        /// <summary>
        /// Invalidates the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        void Invalidate(string key);

        /// <summary>
        /// Determines whether the specified key is set.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <returns>
        ///   <c>true</c> if the specified key is set; otherwise, <c>false</c>.
        /// </returns>
        bool IsSet(string key);

        /// <summary>
        /// Sets the specified key.
        /// </summary>
        /// <param name="key">The key.</param>
        /// <param name="data">The data.</param>
        /// <param name="cacheTime">The cache time.</param>
        void Set(string key, object data, int cacheTime);
    }
}