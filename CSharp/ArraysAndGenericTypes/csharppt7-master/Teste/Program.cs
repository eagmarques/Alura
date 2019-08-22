using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Collections;
using System.ComponentModel;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization;
using System.Text.RegularExpressions;
using System.Text;
using System;

namespace Teste
{
    class Solution
    {

        // Complete the birthdayCakeCandles function below.
        static int birthdayCakeCandles(int[] ar)
        {
            ar.Count(ar.Max())
            ar.Max();

        }

        static void Main(string[] args)
        {

            int[] ar = new int[4] {3, 2, 1, 3};
            int result = birthdayCakeCandles(ar);

            Console.WriteLine(result);
        }
    }

}
