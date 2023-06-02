﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Pronia.Migrations
{
    public partial class PlantTagsTableCreated : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PlantTag_Plants_PlantId",
                table: "PlantTag");

            migrationBuilder.DropForeignKey(
                name: "FK_PlantTag_Tags_TagId",
                table: "PlantTag");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PlantTag",
                table: "PlantTag");

            migrationBuilder.RenameTable(
                name: "PlantTag",
                newName: "PlantTags");

            migrationBuilder.RenameIndex(
                name: "IX_PlantTag_PlantId",
                table: "PlantTags",
                newName: "IX_PlantTags_PlantId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PlantTags",
                table: "PlantTags",
                columns: new[] { "TagId", "PlantId" });

            migrationBuilder.AddForeignKey(
                name: "FK_PlantTags_Plants_PlantId",
                table: "PlantTags",
                column: "PlantId",
                principalTable: "Plants",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PlantTags_Tags_TagId",
                table: "PlantTags",
                column: "TagId",
                principalTable: "Tags",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PlantTags_Plants_PlantId",
                table: "PlantTags");

            migrationBuilder.DropForeignKey(
                name: "FK_PlantTags_Tags_TagId",
                table: "PlantTags");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PlantTags",
                table: "PlantTags");

            migrationBuilder.RenameTable(
                name: "PlantTags",
                newName: "PlantTag");

            migrationBuilder.RenameIndex(
                name: "IX_PlantTags_PlantId",
                table: "PlantTag",
                newName: "IX_PlantTag_PlantId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PlantTag",
                table: "PlantTag",
                columns: new[] { "TagId", "PlantId" });

            migrationBuilder.AddForeignKey(
                name: "FK_PlantTag_Plants_PlantId",
                table: "PlantTag",
                column: "PlantId",
                principalTable: "Plants",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_PlantTag_Tags_TagId",
                table: "PlantTag",
                column: "TagId",
                principalTable: "Tags",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
