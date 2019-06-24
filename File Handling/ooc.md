# Class creation

```c
//- !class declaration
//-  Point: Object
//-      int x
//-      int y

static inline o_Point Point(int x, int y){
    return ooc_new(PointClass(), x, y);
}

//- !class_methods start
void Point_move(o_Point _self, int delta_x, int delta_y);
//- !overwritable
void Point_draw(o_Point _self);
//- !class_methods end
```

```c
//- !class implementation

void Point_move(o_Point _self, int delta_x, int delta_y){
    CAST(self, Point);
    ASSERT(self,);
    self->x += delta_x;
    self->y += delta_y;
}

//- !overwrite
void Point_draw(o_Point _self){
    CAST(self, Point);
    ASSERT(self, );
    printf("Point at %d, %d\n", self->x, self->y);
}

//- !overwrite
void* Point_ctor(void* _self, va_list* app){
    SUPER_CTOR(self, Point);
    ASSERT(self, NULL);
    self->x = CTOR_GET_PARAM(int);
    self->y = CTOR_GET_PARAM(int);
    return self;
}

```