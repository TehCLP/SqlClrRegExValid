using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using Microsoft.SqlServer.Server;

public partial class UserDefinedFunctions
{
    [SqlFunction(IsDeterministic = true, IsPrecise = true)]
    public static SqlBoolean RegExIsMatch(string pattern, string input)
    {
        if (string.IsNullOrEmpty(pattern) || string.IsNullOrEmpty(input))
            return false;

        Regex _regx = new Regex(pattern.TrimEnd(null));
        SqlBoolean _match = _regx.IsMatch(input.TrimEnd(null));
        return _match;
    }
};

