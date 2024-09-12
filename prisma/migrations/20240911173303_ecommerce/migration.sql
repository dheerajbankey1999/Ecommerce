/*
  Warnings:

  - Added the required column `brandId` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productDescription` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sizeCatoryId` to the `ProductCategory` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productCode` to the `ProductItem` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sizeId` to the `ProductItem` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Product" ADD COLUMN     "brandId" INTEGER NOT NULL,
ADD COLUMN     "productDescription" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "ProductCategory" ADD COLUMN     "productCategoryId" INTEGER,
ADD COLUMN     "sizeCatoryId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "ProductItem" ADD COLUMN     "productCode" TEXT NOT NULL,
ADD COLUMN     "sizeId" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "Brand" (
    "brandId" SERIAL NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("brandId")
);

-- CreateTable
CREATE TABLE "sizeCategory" (
    "sizeCatoryId" SERIAL NOT NULL,
    "categoryName" TEXT NOT NULL,

    CONSTRAINT "sizeCategory_pkey" PRIMARY KEY ("sizeCatoryId")
);

-- CreateTable
CREATE TABLE "sizeOption" (
    "sizeId" SERIAL NOT NULL,
    "size_name" TEXT NOT NULL,
    "sortOrder" INTEGER NOT NULL,
    "sizeCatoryId" INTEGER NOT NULL,

    CONSTRAINT "sizeOption_pkey" PRIMARY KEY ("sizeId")
);

-- CreateTable
CREATE TABLE "productVaration" (
    "variationId" SERIAL NOT NULL,
    "itemId" INTEGER NOT NULL,
    "sizeId" INTEGER NOT NULL,
    "quantityStock" INTEGER NOT NULL,

    CONSTRAINT "productVaration_pkey" PRIMARY KEY ("variationId")
);

-- AddForeignKey
ALTER TABLE "ProductCategory" ADD CONSTRAINT "ProductCategory_sizeCatoryId_fkey" FOREIGN KEY ("sizeCatoryId") REFERENCES "sizeCategory"("sizeCatoryId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductCategory" ADD CONSTRAINT "ProductCategory_productCategoryId_fkey" FOREIGN KEY ("productCategoryId") REFERENCES "ProductCategory"("categoryId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "Brand"("brandId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductItem" ADD CONSTRAINT "ProductItem_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES "sizeOption"("sizeId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sizeOption" ADD CONSTRAINT "sizeOption_sizeCatoryId_fkey" FOREIGN KEY ("sizeCatoryId") REFERENCES "sizeCategory"("sizeCatoryId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productVaration" ADD CONSTRAINT "productVaration_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES "ProductItem"("itemId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productVaration" ADD CONSTRAINT "productVaration_sizeId_fkey" FOREIGN KEY ("sizeId") REFERENCES "sizeOption"("sizeId") ON DELETE RESTRICT ON UPDATE CASCADE;
