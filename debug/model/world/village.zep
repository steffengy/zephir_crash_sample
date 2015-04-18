use Debug\AADebug;
use Debug\ORM\EntityQuery;

namespace Debug\Model\World;

class Village
{
    public static function q()
    {
        var tmp;
        let tmp = new EntityQuery(get_called_class());
        return tmp;
    }

    public static function primaryKey()
    {
        return "id_village";
    }

    public static function table()
    {
        return "village";
    }
    
    public function apply(var raw, var with, int scopeID)
    {

    }
}
