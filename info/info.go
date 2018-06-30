package info

import (
	"encoding/json"
	"github.com/ivolynets/wc-catalog-service/meta"
	"github.com/ivolynets/wc-core/model"
	"net/http"
)

// GetInfo returns basic information about the service.
func GetInfo(w http.ResponseWriter, r *http.Request) {
	info := model.Info{Name: meta.Name, Version: meta.Version}
	json.NewEncoder(w).Encode(info)
}
