﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiBase.Model
{
    public class Book
    {
        public string Author { get; set; }
        public string Title { get; set; }
        public bool AgeRestriction { get; set; }
    }
}
