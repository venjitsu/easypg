class Epg < ApplicationRecord
  mount_uploader :spreadsheet, SpreadsheetUploader
end
