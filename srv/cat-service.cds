using { sap.capire.bookshop as my } from '../db/schema';

service CatalogService {
    entity Books as projection on my.Books
    entity Autors as projection on my.Authors
}

annotate CatalogService.Books with @(
    UI: {
        HeaderInfo: {
            TypeName: 'Book',
            TypeNamePlural: 'Books',
            Title: { Value: ID },
            Description: { Value: title }
        },
        SelectionFields: [ ID, title, author.name ],
        LineItem: [
            { Value: ID },
            { Value: title },
            { Value: author.name },
            { Value: price },
            { Value: currency_code }               
        ],
        Facets: [
            {
                $Type: 'UI.CollectionFacet',
                Label: 'Book Info',
                Facets: [
                    {$Type: 'UI.ReferenceFacet', Target: '@UI.FieldGroup#Main', Label: 'Main Facet'}
                ]
            }
        ],        
        FieldGroup#Main: {
            Data: [
                { Value: ID },
                { Value: title },
                { Value: author_ID },
                { Value: price },
                { Value: currency_code }               
            ]
        }
    }
);