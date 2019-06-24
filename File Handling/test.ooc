#ifndef TEST_OOC__
#define TEST_OOC__

//- !class declaration
//-  Point: Object
//-      int x
//-      int y
typedef void* o_Point;

static inline o_Point Point(int x, int y){
    return ooc_new(PointClass(), x, y);
}

//- !class_methods start
void Point_move(o_Point _self, int delta_x, int delta_y);
//- !overwritable
void Point_draw(o_Point _self);
//- !class_methods end

#endif //TEST_OOC__