using { Currency, managed, sap } from '@sap/cds/common';

namespace sap.capire.bookshop;

entity Books : managed {
    key ID       : Integer               @title : 'ID';
        title    : localized String(111) @title : 'Title';
        descr    : localized String(1111)@title : 'Description';
        author   : Association to Authors @title : 'Author';
        stock    : Integer               @title : 'Stock';
        price    : Decimal(9, 2)         @title : 'Price';
        currency : Currency              @title : 'Currency';
}

entity Authors : managed {
    key ID           : Integer     @title : 'Author ID';
        name         : String(111) @title : 'Author Name';
        dateOfBirth  : Date        @title : 'Date of Birth';
        dateOfDeath  : Date        @title : 'Date of Death';
        placeOfBirth : String      @title : 'Place of Birth';
        placeOfDeath : String      @title : 'Place of Death';
        books        : Association to many Books on books.author = $self;
}