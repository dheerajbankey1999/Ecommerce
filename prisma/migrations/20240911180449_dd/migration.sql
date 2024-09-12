-- DropForeignKey
ALTER TABLE "ProductCategory" DROP CONSTRAINT "ProductCategory_productCategoryId_fkey";

-- AlterTable
ALTER TABLE "ProductCategory" ADD COLUMN     "parentCategoryId" INTEGER;

-- AddForeignKey
ALTER TABLE "ProductCategory" ADD CONSTRAINT "ProductCategory_parentCategoryId_fkey" FOREIGN KEY ("parentCategoryId") REFERENCES "ProductCategory"("categoryId") ON DELETE SET NULL ON UPDATE CASCADE;
