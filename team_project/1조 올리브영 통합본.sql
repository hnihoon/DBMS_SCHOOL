--�赿�� ����

create table gift_card( --����Ʈī�� ���� ���̺�(�赿��)
    gj_code varchar2(20)    not null
    ,gj_name varchar2(100)  not null
    ,gj_image varchar2(50)  not null
    ,primary key(gj_code)
);

drop table gift_card;

select * from gift_card; -- ��

insert into gift_card(gj_code, gj_name, gj_image)
values('gg001','�����ϴ�(2023)', '�����ϴ�(2023)�̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('gl002','������������', '�������������̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('go003','���� �ø���', '���� �ø����̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('go004','�����ִ� �ø���', '�����ִ� �ø����̹���');

insert into gift_card(gj_code, gj_name, gj_image)
values('gg005','���ο� ������ ������', '���ο� ������ �������̹���');

select * from gift_card;
////////////////////////////////////////////////////////////////////////////////

create table big_category_table( --�� ī�װ� ��ǰ���̺�(�赿��)
    product_category    varchar2(15)
    ,product_catename   varchar2(20)
    ,product_name	    varchar2(150)
    ,product_image	    varchar2(50)
    ,primary key(product_category)
);

drop table big_category_table;

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s001','��Ų�ɾ�','�츣���� ���ο� 200ml 2�� �� 1','�츣�����̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s002','��Ų�ɾ�','[�̴�Ÿ������] �긵�׸� ƼƮ����ī������� ��뷮������ȹ','�긵�׸��̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m001','����ũ��','[NEW] �Ҿ� ��� ������ ƾƮ','�Ҿ��̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m002','����ũ��','Ŭ���� ���� �� ���� ���������� �潽���̳�','Ŭ�����̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n001','����','[NEW] ����Ʈ �÷� ���� 19�� 14ml','����Ʈ�̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n002','����','[NEW] ����� �÷� �۸��� ���� ������ 7��','������̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p001','���/��ǻ��','������ �긮Ʈ���� EDT 3�� ��1 (30ml/50ml/100ml)','�������̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p002','���/��ǻ��','���ٹ��佺 ��Ƽ�� EDT 40ml/75ml/125ml ��ǰ 3�� ��1','���ٹ��佺�̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c001','Ŭ��¡','�丮�� ���̺��� ������ ���˷�л� Ŭ��¡ �� 150ml','�丮���̹���');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c002','Ŭ��¡','[��뷮] ���左 1025 ���� Ŭ���� 200ml �����ȹ','���左�̹���');

select * from big_category_table;

drop table big_category_table;

////////////////////////////////////////////////////////////////////////////////

create table detailed_category_table( -- �� ��ǰ ���̺�(�赿��)
    detailed_procode    varchar2(20)    not null
    ,product_category   varchar2(15)    not null
    ,option_name        varchar2(100)   not null
    ,product_price      number(10)      not null
    ,discount           number(2)       not null
    ,primary key (detailed_procode)
);

drop table detailed_category_table cascade constraints;

drop table detailed_category_table;

-- �ܷ�Ű ����
alter table detailed_category_table
add constraints fk_detailed_category_table foreign key (product_category)
references big_category_table(product_category);


insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0011','s001','��Ų��ũ200ml',23700,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0022','s002','500ml+����Ÿ��',45000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('om0021','m002','001��',10000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('on0012','n001','16�� ����',15000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0021','c001','200ml',20000,20);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0022','c002','500ml',45000,30);

select * from detailed_category_table;
////////////////////////////////////////////////////////////////////////////////

create table Inventory_table( --�����Ȳ ���̺�(�赿��)
    detailed_procode    varchar2(20)
    ,Inventory_date     date       
    ,restock            number(4)
    ,restock_shipment   varchar2(6)
);

drop table Inventory_table;

-- �ܷ�Ű ����
alter table Inventory_table
add constraints fk_Inventory_table foreign key(detailed_procode)
references detailed_category_table(detailed_procode);

delete Inventory_table
where detailed_procode='os0011';

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,10,'�԰�');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,3,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,1,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,2,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,1,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,1,'���');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,1,'���');

select detailed_procode,to_char(Inventory_date,'YYYY-MM-DD'),restock,restock_shipment
from Inventory_table;

--�赿�� ��

================================================================================

--������

--����Ʈī�� �������̺�(������)
create table giftcard_object(
		gcoid varchar2(30) NOT NULL,
		gcid varchar2(30) NOT NULL,
		gcamount number NOT NULL,
		primary key(gcoid),
		foreign key(gcid) references giftcard(gcid)
		ON DELETE cascade
		);
		
insert into giftcard_object(gcoid, gcid, gcamount)
values('gco001', 'gc001', 30000);

update giftcard set gcid = 'gc002' where gcid = 'gc001'; 		
select * from giftcard_object;

select * from giftcard_object;

drop table giftcard_object;

--����Ʈī�� ���ų���(������)
create table giftcard_purchase_history(
		oid varchar2(30) NOT NULL,
		gcoid varchar2(30) NOT NULL,
		primary key(oid),
		foreign key(oid) references ocus(oid)
		ON DELETE cascade,
		foreign key(gcoid) references giftcard_object(gcoid)
		ON DELETE cascade
		);
		
insert into giftcard_purchase_history(oid, gcoid)
values('c001', 'gco001');

select * from giftcard_purchase_history;

--����Ʈī�� ��뿩��(������)
create table giftcard_use(
		gcoid varchar2(30) NOT NULL,
		oid varchar2(30) NOT NULL,
		gcuse char(1) NOT NULL check(gcuse in('Y', 'N')),
		primary key(gcoid, oid),
		foreign key(gcoid) references giftcard_object(gcoid),
		foreign key(oid) references ocus(oid)
		on delete cascade
		);
        
		
insert into giftcard_use(gcoid, oid, gcuse)
values('gco001', 'c002' ,'N');

select * from giftcard_use;

drop table giftcard_use;
		
--����Ʈī�� ����Ʈ ��Ȳ(������)
create table giftcardpoint_cur(
		oid varchar2(30) NOT NULL,
		gcpoint number NOT NULL,
		primary key(oid),
		foreign key(oid) references ocus(oid)
		on delete cascade
);

insert into giftcardpoint_cur(oid, gcpoint)
values('itwill1', 1000);

select * from giftcardpoint_cur;

drop table giftcardpoint_cur;

-- ������

////////////////////////////////////////////////////////////////////////////////

-- ��ҿ�

create table ocus(                       --���������̺�(��ҿ�)
   oid      varchar2(30)    
  ,oname    varchar2(50)
  ,opass    number(10)
  ,ocall    varchar2(15)
  ,obirth   date
  ,oemail   varchar2(50)
  ,opoint   number(10)
  ,oaddr    varchar2(100)
  ,ovip     varchar2(10)
  ,primary key(oid)
);

insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill1', '�赿��', 123456, '010-1111-2222', '1993-10-04', 'itwill1@gmail.com', 10, '����� ���Ǳ� ��õ�� 111-23', 'gold');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill2', '��ҿ�', 123457, '010-1111-2223', '1993-10-05', 'itwill2@gmail.com', 20, '����� ���Ǳ� ��õ�� 111-24', 'baby');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill3', '������', 123458, '010-1111-2224', '1993-10-06', 'itwill3@gmail.com', 30, '����� ���Ǳ� ��õ�� 111-25', 'black');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill4', '��ȿ��', 123459, '010-1111-2225', '1993-10-07', 'itwill4@gmail.com', 40, '����� ���Ǳ� ��õ�� 111-26', 'pink');
commit;

select count(*) from ocus;   --���������̺� Ȯ��
select * from ocus;
drop table ocus;


create table ocp_table(                --�������� ���̺�(��ҿ�)
   ocp      varchar2(15)    
  ,ocpname    varchar2(30)
  ,ocpdc    varchar2(30)
  ,ocpcon    number
  ,ocpst   date
  ,ocpend   date
  ,primary key(ocp)
);

insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp001', '�������� ����', '10% ����', 10000, '2023-08-31', '2023-09-06' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp002', '�ű԰����� ����', '30% ����', 10000, '2023-08-30', '2024-09-30' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp003', 'VIP ����', '20% ����', 10000, '2023-08-31', '2024-08-31' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp004', '5000�� ���� ����', '5000�� ����', 50000, '2023-08-30', '2024-08-30' );
commit;

select count(*) from ocp_table; --�������� ���̺� Ȯ��
select * from ocp_table;
drop table ocp_table;

create table ocpman(                --�������� ���̺�(��ҿ�)
   oid varchar2(30)
  ,ocp varchar2(15)
  ,ocpus char(1)
  ,FOREIGN KEY (oid) --�ܷ�Ű���� ���� 1
  REFERENCES ocus(oid)
);

alter table ocpman   --�ܷ�Ű �߰� ������Ʈ�ϴ¹�� 2
add constraints fk_ocpman foreign key(ocp)
references ocp_table(ocp);

insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp001', 'Y');
insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill2', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp003', 'N');
commit;

select count(*) from ocpman; --�������� ���̺� Ȯ��
select * from ocpman;
drop table ocpman;

create table ovipinfo(                       --����������� ���̺�(��ҿ�)
   ovip     varchar2(30)    
  ,ovipcon  varchar2(100)
  ,ovippo   varchar2(15)
  ,primary key(ovip)
);

insert into ovipinfo(ovip,ovipcon,ovippo) values('gold', '100�����̻�', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('black', '70�����̻� 100�����̸�', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('green', '40�����̻� 70�����̸�', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('pink', '10�����̻� 40�����̸�', '0.50%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('baby', '10�����̸�', '0.50%');
commit;

select count(*) from ovipinfo; --����������� ���̺� Ȯ��
select * from ovipinfo;
drop table ovipinfo;

-- ��ҿ� ��

////////////////////////////////////////////////////////////////////////////////

-- ��ȿ��

�� ���� ���̺� �߰�

create table notice_table(
    notice_code     varchar2(10)    not null     --����������ȣ
   ,notice_num      number(30)      not null     --������ȣ
   ,notice_class    varchar2(10)    not null     --�����з�
   ,notice_name     varchar2(100)   not null     --��������
   ,notice_content  varchar2(200)   not null     --��������
   ,notice_date     date            not null     --�����ۼ���
);

drop table notice_table;


���� �� �߰�
insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong001','1', '�Ϲ�','���̽��ǽ� ���� �� �������Ա� �������� �ߴ� �ȳ�','�ø��꿵 �������Ա� �������� �ߴ�','2023-08-31');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev001','2','�̺�Ʈ','7�� <��������Ʈ �׷��� ����> �̺�Ʈ �װ��� ��÷�� ��ǥ','��÷�� dor*****��*��8940','2023-07-28');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('me001','3','����','������ �˸��ϴ�!!','���� ���ΰ������Դϴ�','2023-07-25');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev002','4','�̺�Ʈ','���� 50% Ư��!!','���̸���ũ����ǰ Ư��','2023-06-30');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong002','5','�Ϲ�','���� �̿�� ����ũ ���� �ǰ�~!','����ũ ���� ��Ź�帳�ϴ�','2023-05-01');


select * from notice_table;


select notice_code �ڵ�, notice_num ��ȣ, notice_class �з�, notice_name ����, notice_content ����, notice_date �ۼ���
from notice_table
order by notice_num, notice_date desc;

----------------------------------------------------------------------------
�� ���� ���̺� 

drop table review_table;

create table review_table(
    oid         varchar2(30)       not null   --�����̵�(FK)
   ,review_content     varchar2(200)      not null   --���䳻��  
   ,starjum            number(5)          not null   --����
   ,review_date        date               not null   --�ۼ�����
   ,detailed_procode   varchar2(20)       not null  --�󼼻�ǰ�ڵ�(FK)
   --,foreign key(review_oid) references ocus(oid)
   --,foreign key(detailed_procode) references detailed_category_table(detailed_procode) 
);


���� �� �߰�

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill1','�ʹ� ���ƿ�!','5','2023-08-31','os0011');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill2','�����̿���','3','2023-07-22','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','���ƿ�!','4','2023-07-14','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','���ο���!','1','2023-06-26','oc0021');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','�ʹ� ���ƿ�!','5','2023-05-17','oc0022');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','�����̿���!','3','2023-05-17','os0022');


select * from review_table;

select review_oid ��ID, review_content ����, starjum ��, review_date �ۼ�����, detailed_procode �󼼻�ǰ�ڵ�
from review_table
order by review_date desc;

--�ܷ�Ű ����
--�� ID
alter table review_table
add constraints fk_review_oid foreign key(oid)
references ocus(oid);

--��ǰ�ڵ�
alter table review_table
add constraints fk_detailed_procode foreign key(detailed_procode)
references detailed_category_table(detailed_procode);


----------------------------------------------------------------------------

drop table opur;

�� ���Ź�ǰ��ϳ��� ���̺� �߰�

create table opur(
    purchase_code       number(11)             --�ֹ���ȣ
   ,detailed_procode    varchar2(50)           --�󼼻�ǰ�ڵ�
   ,oquantity           number(10)             --��ǰ����
   ,foreign key(purchase_code) references purlist_table(purchase_code)
   --,foreign key(detailed_procode) references detailed_category_table(detailed_procode)
);


insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000001','os0011','3');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000002','on0021','2');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000003','on0012','1');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000003','oc0021','1');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000004','oc0022','1');

insert into opur(purchase_code,detailed_procode,oquantity)
values('23083000004','os0022','1');

select * from opur;

--------------------------------------------------------------------------
�� ���ų��� ���̺� �߰�

drop table purlist_table;

create table purlist_table(
    purchase_code       number(11)       --�ֹ���ȣ
   ,oid                 varchar2(30)     --��ID
   ,receive_name        varchar2(20)     --�޴� ��
   ,phone_number        varchar2(13)     --�޴� �� ��ȭ��ȣ
   ,address             varchar2(100)    --�����
   ,message             varchar2(100)    --��۸޼���
   ,payment_method      varchar2(15)     --�������
   ,payment_gift        varchar2(30)     --����Ʈī��ID
   ,payment_coupon      varchar(4)       --���� ���    
   ,payment_point       number(10)       --����Ʈ ���
   ,total               number(10)       --�� ���� �ݾ�
   ,primary key(purchase_code)
   --,foreign key(oid) references ocus(oid)   
   --,foreign key(payment_gift) references giftcard_object(gcid)
);

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000001','itwill1','�赿��','010-1111-2222','����� ���Ǳ� ��õ�� 111-23','���տ� ���ּ���','ī��','gci002',null,'0','21330');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000002','itwill2','��ҿ�','010-1234-5678','����� ���Ǳ� ��õ�� 111-24','��ȭ�ּ���','�������',null,null,'0','32000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000003','itwill3','������','010-1122-3344','����� ���Ǳ� ��õ�� 111-25','���� ��й�ȣ1234','������ü',null,null,'0','27000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000004','itwill4','��ȿ��','010-1235-6819','����� ���Ǳ� ��õ�� 111-26','������ ������~','īī������',null,null,'0','52200');
    

select * from purlist_table;


select purchase_code �ֹ���ȣ, oid ��ID, receive_name  �޴º�, phone_number �޴º���ȭ��ȣ, address �����, message ��۸޼���, payment_method �������, payment_gift ����Ʈī��ID
        ,payment_coupon �������, payment_point ����Ʈ���, total �Ѱ����ݾ�
    from purlist_table;

-- ��ȿ�� ��



