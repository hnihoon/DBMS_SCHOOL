--김동훈 시작

create table gift_card( --기프트카드 종류 테이블(김동훈)
    gj_code varchar2(20)    not null
    ,gj_name varchar2(100)  not null
    ,gj_image varchar2(50)  not null
    ,primary key(gj_code)
);

drop table gift_card;

select * from gift_card; -- ㅇ

insert into gift_card(gj_code, gj_name, gj_image)
values('gg001','고맙습니다(2023)', '고맙습니다(2023)이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('gl002','여행을떠나요', '여행을떠나요이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('go003','나는 올리브', '나는 올리브이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('go004','생기있는 올리브', '생기있는 올리브이미지');

insert into gift_card(gj_code, gj_name, gj_image)
values('gg005','새로운 시작을 응원해', '새로운 시작을 응원해이미지');

select * from gift_card;
////////////////////////////////////////////////////////////////////////////////

create table big_category_table( --빅 카테고리 상품테이블(김동훈)
    product_category    varchar2(15)
    ,product_catename   varchar2(20)
    ,product_name	    varchar2(150)
    ,product_image	    varchar2(50)
    ,primary key(product_category)
);

drop table big_category_table;

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s001','스킨케어','우르오스 올인원 200ml 2종 택 1','우르오스이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('s002','스킨케어','[미니타월증정] 브링그린 티트리시카수딩토너 대용량증정기획','브링그린이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m001','메이크업','[NEW] 롬앤 쥬시 래스팅 틴트','롬앤이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('m002','메이크업','클리오 샤프 쏘 심플 워터프루프 펜슬라이너','클리오이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n001','네일','[NEW] 르멘트 컬러 네일 19종 14ml','르멘트이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('n002','네일','[NEW] 팁토우 시럽 글리터 네일 폴리쉬 7종','팁토우이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p001','향수/디퓨저','버버리 브리트쉬어 EDT 3종 택1 (30ml/50ml/100ml)','버버리이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('p002','향수/디퓨저','존바바토스 아티산 EDT 40ml/75ml/125ml 단품 3종 택1','존바바토스이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c001','클렌징','토리든 다이브인 저분자 히알루론산 클렌징 폼 150ml','토리든이미지');

insert into big_category_table(product_category,product_catename,product_name,product_image)
values('c002','클렌징','[대용량] 라운드랩 1025 독도 클렌저 200ml 더블기획','라운드랩이미지');

select * from big_category_table;

drop table big_category_table;

////////////////////////////////////////////////////////////////////////////////

create table detailed_category_table( -- 상세 상품 테이블(김동훈)
    detailed_procode    varchar2(20)    not null
    ,product_category   varchar2(15)    not null
    ,option_name        varchar2(100)   not null
    ,product_price      number(10)      not null
    ,discount           number(2)       not null
    ,primary key (detailed_procode)
);

drop table detailed_category_table cascade constraints;

drop table detailed_category_table;

-- 외래키 설정
alter table detailed_category_table
add constraints fk_detailed_category_table foreign key (product_category)
references big_category_table(product_category);


insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0011','s001','스킨밀크200ml',23700,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('os0022','s002','500ml+순멸타월',45000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('om0021','m002','001블랙',10000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('on0012','n001','16누 브라운',15000,10);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0021','c001','200ml',20000,20);

insert into detailed_category_table(detailed_procode,product_category,option_name
,product_price,discount)
values('oc0022','c002','500ml',45000,30);

select * from detailed_category_table;
////////////////////////////////////////////////////////////////////////////////

create table Inventory_table( --재고현황 테이블(김동훈)
    detailed_procode    varchar2(20)
    ,Inventory_date     date       
    ,restock            number(4)
    ,restock_shipment   varchar2(6)
);

drop table Inventory_table;

-- 외래키 설정
alter table Inventory_table
add constraints fk_Inventory_table foreign key(detailed_procode)
references detailed_category_table(detailed_procode);

delete Inventory_table
where detailed_procode='os0011';

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,10,'입고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0011',sysdate,3,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('os0022',sysdate,1,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('om0021',sysdate,2,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('on0012',sysdate,1,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0021',sysdate,1,'출고');

insert into Inventory_table(detailed_procode,Inventory_date,restock,restock_shipment)
values('oc0022',sysdate,1,'출고');

select detailed_procode,to_char(Inventory_date,'YYYY-MM-DD'),restock,restock_shipment
from Inventory_table;

--김동훈 끝

================================================================================

--조성우

--기프트카드 생성테이블(조성우)
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

--기프트카드 구매내역(조성우)
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

--기프트카드 사용여부(조성우)
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
		
--기프트카드 포인트 현황(조성우)
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

-- 조성우

////////////////////////////////////////////////////////////////////////////////

-- 김소영

create table ocus(                       --고객정보테이블(김소영)
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

insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill1', '김동훈', 123456, '010-1111-2222', '1993-10-04', 'itwill1@gmail.com', 10, '서울시 관악구 봉천동 111-23', 'gold');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill2', '김소영', 123457, '010-1111-2223', '1993-10-05', 'itwill2@gmail.com', 20, '서울시 관악구 봉천동 111-24', 'baby');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill3', '조성우', 123458, '010-1111-2224', '1993-10-06', 'itwill3@gmail.com', 30, '서울시 관악구 봉천동 111-25', 'black');
insert into ocus(oid,oname,opass,ocall,obirth,oemail,opoint,oaddr,ovip) values ('itwill4', '임효은', 123459, '010-1111-2225', '1993-10-07', 'itwill4@gmail.com', 40, '서울시 관악구 봉천동 111-26', 'pink');
commit;

select count(*) from ocus;   --고객정보테이블 확인
select * from ocus;
drop table ocus;


create table ocp_table(                --쿠폰종류 테이블(김소영)
   ocp      varchar2(15)    
  ,ocpname    varchar2(30)
  ,ocpdc    varchar2(30)
  ,ocpcon    number
  ,ocpst   date
  ,ocpend   date
  ,primary key(ocp)
);

insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp001', '생일축하 쿠폰', '10% 할인', 10000, '2023-08-31', '2023-09-06' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp002', '신규가입자 쿠폰', '30% 할인', 10000, '2023-08-30', '2024-09-30' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp003', 'VIP 쿠폰', '20% 할인', 10000, '2023-08-31', '2024-08-31' );
insert into ocp_table(ocp,ocpname,ocpdc,ocpcon,ocpst,ocpend) values('cp004', '5000원 할인 쿠폰', '5000원 할인', 50000, '2023-08-30', '2024-08-30' );
commit;

select count(*) from ocp_table; --쿠폰종류 테이블 확인
select * from ocp_table;
drop table ocp_table;

create table ocpman(                --쿠폰관리 테이블(김소영)
   oid varchar2(30)
  ,ocp varchar2(15)
  ,ocpus char(1)
  ,FOREIGN KEY (oid) --외래키같이 생성 1
  REFERENCES ocus(oid)
);

alter table ocpman   --외래키 추가 업데이트하는방식 2
add constraints fk_ocpman foreign key(ocp)
references ocp_table(ocp);

insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp001', 'Y');
insert into ocpman(oid,ocp,ocpus) values('itwill1', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill2', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp002', 'N');
insert into ocpman(oid,ocp,ocpus) values('itwill3', 'cp003', 'N');
commit;

select count(*) from ocpman; --쿠폰관리 테이블 확인
select * from ocpman;
drop table ocpman;

create table ovipinfo(                       --등급정보관리 테이블(김소영)
   ovip     varchar2(30)    
  ,ovipcon  varchar2(100)
  ,ovippo   varchar2(15)
  ,primary key(ovip)
);

insert into ovipinfo(ovip,ovipcon,ovippo) values('gold', '100만원이상', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('black', '70만원이상 100만원미만', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('green', '40만원이상 70만원미만', '1.00%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('pink', '10만원이상 40만원미만', '0.50%');
insert into ovipinfo(ovip,ovipcon,ovippo) values('baby', '10만원미만', '0.50%');
commit;

select count(*) from ovipinfo; --등급정보관리 테이블 확인
select * from ovipinfo;
drop table ovipinfo;

-- 김소영 끝

////////////////////////////////////////////////////////////////////////////////

-- 임효은

● 공지 테이블 추가

create table notice_table(
    notice_code     varchar2(10)    not null     --공지고유번호
   ,notice_num      number(30)      not null     --공지번호
   ,notice_class    varchar2(10)    not null     --공지분류
   ,notice_name     varchar2(100)   not null     --공지제목
   ,notice_content  varchar2(200)   not null     --공지내용
   ,notice_date     date            not null     --공지작성일
);

drop table notice_table;


공지 행 추가
insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong001','1', '일반','보이스피싱 주의 및 무통장입금 결제서비스 중단 안내','올리브영 무통장입금 결제서비스 중단','2023-08-31');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev001','2','이벤트','7월 <럭스에디트 그랜드 오픈> 이벤트 항공권 당첨자 발표','당첨자 dor*****조*하8940','2023-07-28');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('me001','3','매장','강남점 알립니다!!','현재 내부공사중입니다','2023-07-25');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('ev002','4','이벤트','할인 50% 특가!!','아이메이크업제품 특가','2023-06-30');

insert into notice_table(notice_code, notice_num,notice_class,notice_name,notice_content,notice_date)
values('gong002','5','일반','매장 이용시 마스크 착용 권고~!','마스크 착용 부탁드립니다','2023-05-01');


select * from notice_table;


select notice_code 코드, notice_num 번호, notice_class 분류, notice_name 제목, notice_content 내용, notice_date 작성일
from notice_table
order by notice_num, notice_date desc;

----------------------------------------------------------------------------
● 리뷰 테이블 

drop table review_table;

create table review_table(
    oid         varchar2(30)       not null   --고객아이디(FK)
   ,review_content     varchar2(200)      not null   --리뷰내용  
   ,starjum            number(5)          not null   --별점
   ,review_date        date               not null   --작성일자
   ,detailed_procode   varchar2(20)       not null  --상세상품코드(FK)
   --,foreign key(review_oid) references ocus(oid)
   --,foreign key(detailed_procode) references detailed_category_table(detailed_procode) 
);


리뷰 행 추가

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill1','너무 좋아요!','5','2023-08-31','os0011');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill2','보통이에요','3','2023-07-22','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','좋아요!','4','2023-07-14','on0012');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill3','별로예요!','1','2023-06-26','oc0021');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','너무 좋아요!','5','2023-05-17','oc0022');

insert into review_table(oid,review_content,starjum,review_date,detailed_procode)
values('itwill4','보통이에요!','3','2023-05-17','os0022');


select * from review_table;

select review_oid 고객ID, review_content 내용, starjum 평가, review_date 작성일자, detailed_procode 상세상품코드
from review_table
order by review_date desc;

--외래키 설정
--고객 ID
alter table review_table
add constraints fk_review_oid foreign key(oid)
references ocus(oid);

--상품코드
alter table review_table
add constraints fk_detailed_procode foreign key(detailed_procode)
references detailed_category_table(detailed_procode);


----------------------------------------------------------------------------

drop table opur;

● 구매물품목록내역 테이블 추가

create table opur(
    purchase_code       number(11)             --주문번호
   ,detailed_procode    varchar2(50)           --상세상품코드
   ,oquantity           number(10)             --물품수량
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
● 구매내역 테이블 추가

drop table purlist_table;

create table purlist_table(
    purchase_code       number(11)       --주문번호
   ,oid                 varchar2(30)     --고객ID
   ,receive_name        varchar2(20)     --받는 분
   ,phone_number        varchar2(13)     --받는 분 전화번호
   ,address             varchar2(100)    --배송지
   ,message             varchar2(100)    --배송메세지
   ,payment_method      varchar2(15)     --결제방식
   ,payment_gift        varchar2(30)     --기프트카드ID
   ,payment_coupon      varchar(4)       --쿠폰 사용    
   ,payment_point       number(10)       --포인트 사용
   ,total               number(10)       --총 결제 금액
   ,primary key(purchase_code)
   --,foreign key(oid) references ocus(oid)   
   --,foreign key(payment_gift) references giftcard_object(gcid)
);

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000001','itwill1','김동훈','010-1111-2222','서울시 관악구 봉천동 111-23','문앞에 놔주세요','카드','gci002',null,'0','21330');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000002','itwill2','김소영','010-1234-5678','서울시 관악구 봉천동 111-24','전화주세요','간편결제',null,null,'0','32000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000003','itwill3','조성우','010-1122-3344','서울시 관악구 봉천동 111-25','현관 비밀번호1234','계좌이체',null,null,'0','27000');

insert into purlist_table(purchase_code,oid,receive_name,phone_number,address,message,payment_method,payment_gift,payment_coupon,payment_point,total)
values('23083000004','itwill4','임효은','010-1235-6819','서울시 관악구 봉천동 111-26','조심히 오세요~','카카오페이',null,null,'0','52200');
    

select * from purlist_table;


select purchase_code 주문번호, oid 고객ID, receive_name  받는분, phone_number 받는분전화번호, address 배송지, message 배송메세지, payment_method 결제방식, payment_gift 기프트카드ID
        ,payment_coupon 쿠폰사용, payment_point 포인트사용, total 총결제금액
    from purlist_table;

-- 임효은 끝



