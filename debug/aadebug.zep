use Debug\Model\World\Village;
use Debug\ORM\EntityQuery;
use Debug\Controllers\Game\Map\Mini;
namespace Debug;

class AADebug
{
    public village;
    public static debugMode = true;

    public function run()
    {
        let _GET["village_id"] = 1;
        if array_key_exists("village_id", _GET) {
            let this->village = Village::q()->where([])->find();
        }

        var con_map;
        let con_map = new Mini();
        let this->village = Village::q()->where([])->find();
    }
}
