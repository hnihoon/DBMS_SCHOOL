create table gift_card(
    gj_code varchar2(20)    not null
    ,gj_name varchar2(100)  not null
    ,gj_image varchar2(50)  not null
    ,primary key(gj_code)
);

select * from gift_card;
////////////////////////////////////////////////////////////////////////////////

create table big_category_table(
    product_category    varchar2(15)
    ,product_catename   varchar2(20)
    ,product_name	    varchar2(150)
    ,product_image	    varchar2(50)
    ,primary key(product_category)
);

select * from big_category_table;
////////////////////////////////////////////////////////////////////////////////

create table detailed_category_table(
    detailed_procode    varchar2(20) primary key
    ,product_category   varchar2(15) 
    ,option_name        varchar2(100)
    ,product_price      number(10)
    ,discount           number(2)
);

-- 외래키 설정
alter table detailed_category_table
add constraints fk_detailed_category_table foreign key (product_category)
references big_category_table(product_category);

select * from detailed_category_table;
////////////////////////////////////////////////////////////////////////////////

create table Inventory_table(
    detailed_procode    varchar2(20)
    ,Inventory_date     date       
    ,restock            number(4)
    ,restock_shipment   varchar2(6)
);

-- 외래키 설정
alter table Inventory_table
add constraints fk_Inventory_table foreign key(detailed_procode)
references detailed_category_table(detailed_procode);

select * from Inventory_table;
