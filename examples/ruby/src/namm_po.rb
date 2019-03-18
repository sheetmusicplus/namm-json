require "protobuf"
require 'test/unit/assertions'

require_relative "../lib/namm_po_pb"

include Test::Unit::Assertions
include NammStandards

# build a data structure of NammPoData
namm_po = NammPoData.new({
  id: "11383",
  timestamp: "2013-12-20T10:20:06",
  header: PoHeaderData.new({
    buyer_order_id: "65642X",
    sold_to: PartyData.new({
      party_id: "000010298975",
      name: "Bill's Music",
      address: AddressData.new({
        address_1: "1 Main St",
        city: "New York",
        state: "NY",
        postal_code: "11101",
        country: "USA",
        country_code: "US"
      })
    }),
    bill_to: PartyData.new({
      party_id: "000010298975",
      name: "Bill's Music",
      address: AddressData.new({
        address_1: "1 Main St",
        city: "New York",
        state: "NY",
        postal_code: "11101",
        country: "USA",
        country_code: "US"
      })
    }),
    ship_to: PartyData.new({
      party_id: "098765432123",
      name: "Bill's Music",
      address: AddressData.new({
        address_1: "1 Main St",
        city: "New York",
        state: "NY",
        postal_code: "11101"
      })
    }),
    supplier: PartyData.new({
      party_id: "0670716000009",
      name: "Korg USA, Inc."
    }),
    terms: TermsData.new({
      code: TermCode::P001
    })
  }),
  detail: PoDetailData.new({
    items: [
      ItemData.new({
        buyer_item_id: "MAA207",
        buyer_item_desc: "Vox amPlug Twin Headphone Amp",
        quantity: QuantityData.new({
          units: 1,
          units_of_measure: QuantityUOM::EA
        })
      }),
      ItemData.new({
        buyer_item_id: "MAA055",
        buyer_item_desc: "Vox AmPlug Headphone Guitar Amp, Classic Rock",
        quantity: QuantityData.new({
          units: 1,
          units_of_measure: QuantityUOM::EA
        }),
        ship_to: PartyData.new({
            party_id: "N/A",
            name: "Jack Smith",
            address: AddressData.new({
              address_1: "101 Diana Dr",
              city: "Guyton",
              state: "GA",
              postal_code: "31312"
            })
        })
      })
    ]
  })
})

# encode and decode into another Ruby Object
bytes = NammPoData.encode(namm_po)
other_namm_po = NammPoData.decode(bytes)

# both Ruby Objects must be equal
assert(namm_po == other_namm_po, "must be equal")

# encode a JSON data structure of NammPoData
json = NammPoData.encode_json(namm_po)
puts json
