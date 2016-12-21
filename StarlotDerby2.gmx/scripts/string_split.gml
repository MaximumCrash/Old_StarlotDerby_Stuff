///string_split(string, split)
///Returns an array of strings after splitting the initial string
/* 
 * Example use:
 * var str = "These are some words";
 * word_list = string_split(str, " ");
 * //Returns a list containing ("These", "are", "some", "words")
 * Used to be a DS_LIST, but it's not necessary for what I need it for. 
 */
var str = argument0;
var split = argument1;
var list;
var number = string_count(split, str);

if (number == 0)
{
    list[number] = str; 
}
else
{
    for (var i = 0; i < number; i++)
    {
        var pos = string_pos(split, str);
        list[i] = string_copy(str,1,pos-1);
        str = string_delete(str, 1, pos);
    }

}
return list;

