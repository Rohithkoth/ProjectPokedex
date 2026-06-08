// =============================================================
//  dexGroups.js — Dex Group Configuration
//
//  Defines how dexes are grouped into game cards on the
//  landing page and how sections are divided within each game.
//
//  Each group has:
//    key      → unique identifier for this game group
//    name     → display name on the landing page card
//    sections → ordered list of dex sections within this game
//               each section has a label and one or more dex keys
// =============================================================

const DEX_GROUPS = [
  {
    key: 'home',
    name: 'Pokémon HOME',
    sections: [
      { label: 'Kanto Region',     dexKeys: ['kanto_home'] },
      { label: 'Johto Region',     dexKeys: ['johto_home'] },
      { label: 'Hoenn Region',     dexKeys: ['hoenn_home'] },
      { label: 'Sinnoh Region',    dexKeys: ['sinnoh_home'] },
      { label: 'Unova Region',     dexKeys: ['unova_home'] },
      { label: 'Kalos Region',     dexKeys: ['kalos_home'] },
      { label: 'Alola Region',     dexKeys: ['alola_home'] },
      { label: 'Galar Region',     dexKeys: ['galar_home'] },
      { label: 'Hisui Region',     dexKeys: ['hisui_home'] },
      { label: 'Paldea Region',    dexKeys: ['paldea_home'] },
      { label: 'Unknown Origins',  dexKeys: ['other_home'] },
    ],
  },
  {
    key: 'rby',
    name: 'Red / Blue / Yellow',
    sections: [
      { label: 'Kanto Pokédex', dexKeys: ['kanto'] },
    ],
  },
  {
    key: 'gsc',
    name: 'Gold / Silver / Crystal',
    sections: [
      { label: 'GSC Pokédex', dexKeys: ['johto'] },
    ],
  },
  {
    key: 'frlg',
    name: 'FireRed / LeafGreen',
    sections: [
      { label: 'National Pokédex', dexKeys: ['national_frlg'] },
    ],
  },
  {
    key: 'rse',
    name: 'Ruby / Sapphire / Emerald',
    sections: [
      { label: 'Hoenn Pokédex',    dexKeys: ['hoenn'] },
      { label: 'National Pokédex', dexKeys: ['national_rse'] },
    ],
  },
  {
    key: 'dppt',
    name: 'Diamond / Pearl / Platinum',
    sections: [
      { label: 'Sinnoh Pokédex',       dexKeys: ['sinnoh'] },
      { label: 'Platinum Expansion',   dexKeys: ['sinnoh_pt'] },
      { label: 'National Pokédex',     dexKeys: ['national_dppt'] },
    ],
  },
  {
    key: 'hgss',
    name: 'HeartGold / SoulSilver',
    sections: [
      { label: 'Johto Pokédex',    dexKeys: ['johto_hgss'] },
      { label: 'National Pokédex', dexKeys: ['national_hgss'] },
    ],
  },
  {
    key: 'bw',
    name: 'Black / White',
    sections: [
      { label: 'Unova Pokédex',    dexKeys: ['unova'] },
      { label: 'National Pokédex', dexKeys: ['national_bw'] },
    ],
  },
  {
    key: 'b2w2',
    name: 'Black 2 / White 2',
    sections: [
      { label: 'New Unova Pokédex', dexKeys: ['unova_b2w2'] },
      { label: 'White Forest',      dexKeys: ['white_forest'] },
      { label: 'National Pokédex',  dexKeys: ['national_b2w2'] },
    ],
  },
  {
    key: 'xy',
    name: 'X / Y',
    sections: [
      { label: 'Central Kalos',    dexKeys: ['kalos_central'] },
      { label: 'Coastal Kalos',    dexKeys: ['kalos_coastal'] },
      { label: 'Mountain Kalos',   dexKeys: ['kalos_mountain'] },
      { label: 'National Pokédex', dexKeys: ['national_xy'] },
    ],
  },
  {
    key: 'oras',
    name: 'Omega Ruby / Alpha Sapphire',
    sections: [
      { label: 'Hoenn Pokédex',    dexKeys: ['hoenn_oras'] },
      { label: 'National Pokédex', dexKeys: ['national_oras'] },
    ],
  },
  {
    key: 'sm',
    name: 'Sun / Moon',
    sections: [
      { label: 'Alola Pokédex',  dexKeys: ['alola'] },
      { label: 'Island Scan',    dexKeys: ['alola_scan'] },
      { label: 'Other Pokémon',  dexKeys: ['national_sm'] },
    ],
  },
  {
    key: 'usum',
    name: 'Ultra Sun / Ultra Moon',
    sections: [
      { label: 'Alola Pokédex',      dexKeys: ['alola_usum'] },
      { label: 'Island Scan',        dexKeys: ['alola_scan_usum'] },
      { label: 'Ultra Wormhole',     dexKeys: ['alola_wormhole_usum'] },
      { label: 'Other Pokémon',      dexKeys: ['national_usum'] },
    ],
  },
  {
    key: 'lgpe',
    name: "Let's Go Pikachu / Eevee",
    sections: [
      { label: 'Kanto Pokédex', dexKeys: ['kanto_lgpe'] },
    ],
  },
  {
    key: 'swsh',
    name: 'Sword / Shield',
    sections: [
      { label: 'Galar Pokédex',  dexKeys: ['galar'] },
      { label: 'Isle of Armor',  dexKeys: ['galar_armor'] },
      { label: 'Crown Tundra',   dexKeys: ['galar_crown'] },
      { label: 'Other Pokémon',  dexKeys: ['galar_other'] },
    ],
  },
  {
    key: 'bdsp',
    name: 'Brilliant Diamond / Shining Pearl',
    sections: [
      { label: 'Sinnoh Pokédex',   dexKeys: ['sinnoh'] },
      { label: 'National Pokédex', dexKeys: ['national_bdsp'] },
    ],
  },
  {
    key: 'arceus',
    name: 'Legends: Arceus',
    sections: [
      { label: 'Hisui Pokédex', dexKeys: ['hisui'] },
    ],
  },
  {
    key: 'sv',
    name: 'Scarlet / Violet',
    sections: [
      { label: 'Paldea Pokédex',      dexKeys: ['paldea'] },
      { label: 'Kitakami',            dexKeys: ['paldea_kitakami'] },
      { label: 'Blueberry Academy',   dexKeys: ['paldea_blueberry'] },
      { label: 'Other Pokémon',       dexKeys: ['paldea_other'] },
    ],
  },
  {
    key: 'colo',
    name: 'Colosseum',
    sections: [
      { label: 'Gift Pokémon',         dexKeys: ['colo_gift'] },
      { label: 'Snaggable Pokémon',    dexKeys: ['colo_snag'] },
      { label: 'Transferable Pokémon', dexKeys: ['colo_transfer'] },
    ],
  },
  {
    key: 'xd',
    name: 'XD: Gale of Darkness',
    sections: [
      { label: 'Gift Pokémon',         dexKeys: ['xd_gift'] },
      { label: 'Snaggable Pokémon',    dexKeys: ['xd_snag'] },
      { label: 'Poké Spot',            dexKeys: ['xd_pokespot'] },
      { label: 'Transferable Pokémon', dexKeys: ['xd_transfer'] },
    ],
  },
  {
    key: 'champions',
    name: 'Champions Regulation',
    sections: [
      { label: 'Regulation Set M-A', dexKeys: ['champions_reg_ma'] },
    ],
  },
  {
    key: 'lza',
    name: 'Legends Z-A',
    sections: [
      { label: 'Lumiose City', dexKeys: ['lumiose'] },
      { label: 'Hyperspace',   dexKeys: ['hyperspace'] },
    ],
  },
]

export default DEX_GROUPS
