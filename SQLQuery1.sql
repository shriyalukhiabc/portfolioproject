use portfolioproject;

select SaleDate,convert(Date,SaleDate) as convertedsaledate from [dbo].[nashvillehousing];

update nashvillehousing set saledate=convert(Date,SaleDate);

alter table nashvillehousing add convertedsaledate Date;

update nashvillehousing set convertedsaledate=convert(Date,SaleDate);

alter table nashvillehousing drop column saledate;

select * from nashvillehousing;

select a.parcelid,a.propertyaddress,b.parcelid,b.propertyaddress,ISNULL(a.PropertyAddress,b.PropertyAddress) from nashvillehousing a
join nashvillehousing b on a.parcelid=b.parcelid and a.[UniqueID ] <> b.[UniqueID ] where a.PropertyAddress is not NULL;

update a 
set a.propertyaddress= ISNULL(a.PropertyAddress,b.PropertyAddress)
from nashvillehousing a
join nashvillehousing b on a.parcelid=b.parcelid and a.[UniqueID ] <> b.[UniqueID ] where a.PropertyAddress is NULL;

select SUBSTRING(propertyaddress,1,CHARINDEX(',',propertyaddress)-1) as address,
SUBSTRING(propertyaddress,CHARINDEX(',',propertyaddress)+1,LEN(propertyaddress)) as city
from nashvillehousing

alter table nashvillehousing add proaddress varchar(255);

update nashvillehousing set proaddress=SUBSTRING(propertyaddress,1,CHARINDEX(',',propertyaddress)-1);

alter table nashvillehousing add procity varchar(255);

update nashvillehousing set procity=SUBSTRING(propertyaddress,CHARINDEX(',',propertyaddress)+1,LEN(propertyaddress));


