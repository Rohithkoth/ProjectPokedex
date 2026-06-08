package com.pokedex.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.servers.Server;
import io.swagger.v3.oas.models.tags.Tag;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class SwaggerConfig {

        @Bean
        public OpenAPI pokedexOpenAPI() {
                return new OpenAPI()
                                .info(new Info()
                                                .title("Pokédex API")
                                                .version("1.0.0")
                                                .description("""
                                                                # Pokédex REST API

                                                                Backend API for searching and filtering Pokémon data.

                                                                ## Endpoints
                                                                - `GET /api/pokemon/{slug}` — full detail for one Pokémon
                                                                - `GET /api/pokemon/search` — paginated, filterable Pokémon list

                                                                ## Search Filters
                                                                All parameters are optional. Mix and match freely.

                                                                | Param | Type | Description |
                                                                |---|---|---|
                                                                | typeAnd1 | String | First type for AND combination e.g. fire |
                                                                | typeAnd2 | String | Second type for AND combination e.g. dragon |
                                                                | typeOrList | String | Comma-separated types, any match e.g. fire,water,grass |
                                                                | generation | Integer | Filter by generation 1–9 |
                                                                | color | String | Filter by Pokédex color e.g. red |
                                                                | legendary | Boolean | Legendary Pokémon only |
                                                                | mythical | Boolean | Mythical Pokémon only |
                                                                | mega | Boolean | Mega forms only |
                                                                | paradox | Boolean | Paradox Pokémon only |
                                                                | baseFormOnly | Boolean | Base and regional forms only |
                                                                | excludeMega | Boolean | Hide all mega forms |
                                                                | excludeGmax | Boolean | Hide all Gigantamax forms |
                                                                | page | Integer | Page number, 0-indexed, default 0 |
                                                                | size | Integer | Results per page, default 100 |

                                                                ## Type Filter Modes
                                                                Two modes — mutually exclusive, don't use both at once:

                                                                **AND mode** — Pokémon must have BOTH types:
                                                                `?typeAnd1=fire&typeAnd2=dragon` → returns fire/dragon AND dragon/fire

                                                                **OR mode** — Pokémon must have ANY of the types:
                                                                `?typeOrList=fire,water,grass` → returns anything that is fire OR water OR grass
                                                                """))
                                .servers(List.of(
                                                new Server()
                                                                .url("http://localhost:8080")
                                                                .description("Local development server")))
                                .tags(List.of(
                                                new Tag()
                                                                .name("Pokémon")
                                                                .description("Search and retrieve Pokémon data")))
                                .tags(List.of(
                                                new Tag()
                                                                .name("Pokémon")
                                                                .description("Search and retrieve Pokémon data"),
                                                new Tag() // ✅ ADD this
                                                                .name("Catch Tracker")
                                                                .description("Track caught Pokémon per user and game")));
        }
}