#include <amxmodx>
#include <zombie_plague_special>

public plugin_init() {
    register_plugin("Last Human Infectnade Block", "1.0", "Xertav")
}

public zp_extra_item_selected_pre(id, itemid) {
    static infectnade_id = -1
    if(infectnade_id == -1)
        infectnade_id = zp_get_extra_item_id("Infection Bomb")
        
    // Find if anyone is last human
    new last_human = 0
    for(new i = 1; i <= 32; i++) {
        if(is_user_alive(i) && zp_get_user_last_human(i)) {
            last_human = 1
            break
        }
    }
    
    if(itemid == infectnade_id && last_human) {
        return ZP_PLUGIN_HANDLED
    }
    
    return PLUGIN_CONTINUE
}