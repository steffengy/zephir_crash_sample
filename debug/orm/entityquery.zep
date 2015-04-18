use Debug\AADebug;

namespace Debug\ORM;

class EntityQuery
{
    public fields = null;
    public entity = null;
    public where = null;
    public table = null;
    public with = [];
    public joins = []; //Auto generated

    public function __construct(var entity)
    {
        let this->entity = entity;
        if likely entity != null {
            let this->table = {entity}::table();
        }
    }

    public function where(var conditions) -> <EntityQuery>
    {
        let this->where = conditions;
        return this;
    }

    public function findAll(var fieldsParam=null, boolean multiple=true, boolean raw=false)
    {
        var startTime;
        if AADebug::debugMode {
            let startTime = microtime(true);
        }

        var entity, result = null;
        let entity = this->entity;

        /* Some of these if's somehow are required to make it crash, even if they seem redundant */
        var raws = 0;
        if raws == 0 {
            let this->fields = ["abc"];
        }
        if !this->with {
            let this->joins = [];
        }

        let result = json_decode("[{\"id_village\":\"1\",\"id_user_owner\":\"1\",\"name\":\"[001]\",\"x\":\"500\",\"y\":\"500\",\"map_sector\":\"25_25\",\"update\":\"1422293452.2058\",\"visual\":\"1\",\"show_levels\":\"1\",\"show_all_widgets\":\"0\",\"leftcolumn\":null,\"rightcolumn\":null,\"loyalty\":\"100\",\"points\":\"3612\",\"res_wood\":\"47006.106329006\",\"res_stone\":\"38667.965830946\",\"res_iron\":\"52122.192622284\",\"building_main\":\"20\",\"building_barracks\":\"15\",\"building_stable\":\"16\",\"building_garage\":\"15\",\"building_church\":\"0\",\"building_church_f\":\"0\",\"building_snob\":\"1\",\"building_smith\":\"13\",\"building_place\":\"1\",\"building_statue\":\"1\",\"building_market\":\"17\",\"building_wood\":\"22\",\"building_stone\":\"23\",\"building_iron\":\"21\",\"building_farm\":\"23\",\"building_storage\":\"21\",\"building_hide\":\"10\",\"building_wall\":\"19\",\"research_spear\":\"0\",\"research_sword\":\"0\",\"research_axe\":\"0\",\"research_archer\":\"0\",\"research_spy\":\"0\",\"research_light\":\"1\",\"research_marcher\":\"0\",\"research_heavy\":\"0\",\"research_ram\":\"0\",\"research_catapult\":\"0\",\"cached_population\":\"0\"}]", true);

        if unlikely raw {
            if AADebug::debugMode {
                let startTime = ((microtime(true) - startTime) * 1000.0);
            }
        }
        var model, row;
        if count(result) {
            let row = result[0];
            let model = new {entity}();
            model->apply(row, this->with, 0);
        }

        if AADebug::debugMode {
            let startTime = ((microtime(true) - startTime) * 1000.0);
        }

        return model;
    }

    public function find(var fields=null, boolean raw=false)
    {
        return this->findAll(fields, false, raw);
    }
}
