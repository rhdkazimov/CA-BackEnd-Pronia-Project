using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Pronia.Migrations
{
    public partial class PlantImagesTableCreated : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PlantImage_Plants_PlantId",
                table: "PlantImage");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PlantImage",
                table: "PlantImage");

            migrationBuilder.RenameTable(
                name: "PlantImage",
                newName: "PlantImages");

            migrationBuilder.RenameIndex(
                name: "IX_PlantImage_PlantId",
                table: "PlantImages",
                newName: "IX_PlantImages_PlantId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PlantImages",
                table: "PlantImages",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_PlantImages_Plants_PlantId",
                table: "PlantImages",
                column: "PlantId",
                principalTable: "Plants",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PlantImages_Plants_PlantId",
                table: "PlantImages");

            migrationBuilder.DropPrimaryKey(
                name: "PK_PlantImages",
                table: "PlantImages");

            migrationBuilder.RenameTable(
                name: "PlantImages",
                newName: "PlantImage");

            migrationBuilder.RenameIndex(
                name: "IX_PlantImages_PlantId",
                table: "PlantImage",
                newName: "IX_PlantImage_PlantId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_PlantImage",
                table: "PlantImage",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_PlantImage_Plants_PlantId",
                table: "PlantImage",
                column: "PlantId",
                principalTable: "Plants",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
